#!/usr/bin/env ruby

require 'json'
require 'optparse'

class Palette
  class RGB
    def self.parse_hex(s)
      r, g, b = s.sub(/^#/, '').scan(/../).map {|c| c.to_i(16) }
      self.new(r, g, b)
    end

    def initialize(r, g, b)
      @red   = r
      @green = g
      @blue  = b
    end

    def to_hex_s(with_prefix: true)
      prefix = with_prefix ? '#' : ''
      components = '%X%X%X' % [@red, @green, @blue]
      prefix + components
    end
  end

  class Definition
    attr_reader :japanese_name, :color_id, :rgb

    def initialize(japanese_name: , color_id: , rgb: )
      @japanese_name = japanese_name
      @color_id      = color_id
      @rgb           = Palette::RGB.parse_hex(rgb)
    end

    def to_h
      {
        name: @japanese_name,
        id: @color_id,
        rgb: @rgb.to_hex_s,
      }
    end
  end

  class << self
    def define(&block)
      instance.instance_eval(&block)
      instance
    end

    def instance
      @instance ||= self.new
    end

    protected :new
  end

  def initialize
    @defs = []
  end

  def color(japanese_name, color_id, rgb)
    @defs << Palette::Definition.new(japanese_name: japanese_name, color_id: color_id, rgb: rgb)
  end

  def to_h
    {
      colors: @defs.map(&:to_h)
    }
  end

  def to_json
    JSON.generate(self.to_h)
  end

  def to_vim_script
    @defs.map {|df|
      %|let s:%s = '%s'| % [df.color_id, df.rgb.to_hex_s]
    }.join($/)
  end
end

palette = Palette.define do
  color '紫紺'   , :black      , '#3c2f41'
  color '菜の花' , :white      , '#F7F1D5'
  color '灰'     , :dark_gray  , '#828282'
  color '銀鼠'   , :gray       , '#91989F'
  color '今様'   , :red        , '#D05A6E'
  color '桃'     , :magenta    , '#F596AA'
  color '苗'     , :green      , '#86C166'
  color '鶯'     , :dark_green , '#6C6A2D'
  color '藤'     , :purple     , '#8B81C3'
  color '鬱金'   , :yellow     , '#EFBB24'
end

args = {}
OptionParser.new do |o|
  o.on('-j', '--json') { args[:format] = :json }
  o.on('-V', '--vim-script') { args[:format] = :vim }
end.parse!(ARGV)

case args[:format]
when :json
  puts palette.to_json
when :vim
  puts palette.to_vim_script
else
  raise 'No format given'
end
