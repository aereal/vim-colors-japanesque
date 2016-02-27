set background=dark
highlight clear

let g:colors_name = 'japanesque'
if exists('syntax_on')
  syntax reset
endif

" Black:      墨   (#1c1c1c)
" White:      白練 (#ecf6f7)
" Dark Gray:  灰   (#828282)
" Gray:       銀鼠 (#91989F)
" Red:        今様 (#D05A6E)
" Magenta:    桃   (#F596AA)
" Green:      苗   (#86C166)
" Dark Green: 鶯   (#6C6A2D)
" Purple:     藤   (#8B81C3)
" Yellow:     鬱金 (#EFBB24)

" UI
highlight NonText    gui=none guifg=#828282
highlight Todo       gui=none guifg=#D05A6E guibg=NONE
highlight Search     gui=reverse guifg=#EFBB24 guibg=NONE
highlight SignColumn gui=none guifg=#ecf6f7 guibg=#1c1c1c
highlight FoldColumn gui=none guifg=#ecf6f7 guibg=#1c1c1c
highlight VertSplit  gui=none guifg=#828282 guibg=#828282
highlight Error      gui=none guifg=#D05A6E guibg=NONE
highlight ErrorMsg   gui=none guifg=#D05A6E guibg=NONE
highlight WarningMsg gui=none guifg=#EFBB24
highlight SpecialKey gui=none guifg=#6C6A2D
highlight Visual     gui=reverse guifg=fg guibg=bg
highlight Folded     gui=underline guifg=#6C6A2D guibg=bg
highlight MoreMsg    gui=none guifg=#6C6A2D
highlight Conceal    gui=none guifg=#828282
highlight Question   gui=none guifg=#86C166
highlight DiffAdd    gui=none guifg=fg guibg=#86C166
highlight DiffDelete gui=none guifg=fg guibg=#D05A6E
highlight DiffChange gui=none guifg=fg guibg=#EFBB24
highlight DiffText   gui=reverse guifg=fg guibg=#EFBB24

if version >= 700
  highlight Cursor gui=reverse guifg=NONE guibg=NONE
  highlight CursorLine gui=none guibg=#2c2c2c

  highlight LineNr       gui=none guifg=#91989F
  highlight CursorLineNr gui=none guifg=#EFBB24
  highlight Pmenu        gui=none guifg=#ecf6f7 guibg=#D05A6E
  highlight PmenuSel     gui=none guifg=#ecf6f7 guibg=#828282
endif

" Syntax
highlight Normal     gui=none guifg=#ecf6f7 guibg=#1c1c1c
highlight NonText    gui=none guifg=#828282
highlight Comment    gui=none guifg=#91989F
highlight Constant   gui=none guifg=#F596AA
highlight Statement  gui=none guifg=#6C6A2D
highlight PreProc    gui=none guifg=#6C6A2D
highlight Type       gui=none guifg=#efbb24
highlight Identifier gui=none guifg=#8B81C3
highlight Conceal    gui=none guifg=#828282
highlight Special    gui=none guifg=#EFBB24
highlight Title      gui=none guifg=#8B81C3

highlight default link Noise Conceal

" Perl
highlight default link perlVarPlain Identifier
highlight default link perlVarPlain2 Identifier
highlight default link perlStatementStorage StorageClass
highlight default link perlSharpBang Comment
highlight default link perlStringStartEnd Conceal
highlight default link perlMatchStartEnd Conceal
highlight default link perlFunction Statement
highlight default link perlSubName Function
highlight default link perlOperator Operator
highlight default link perlMethod Function
highlight default link perlStatementInclude Include

" JavaScript
highlight default link jsObjectKey Type
highlight default link jsFuncCall Function

" HTML
highlight default link htmlTag Conceal
highlight default link htmlEndTag Conceal
highlight default link htmlTagName Identifier

" TT2
highlight default link tt2_tag Conceal
highlight default link tt2_bracket_r Conceal
highlight default link tt2_operator Conceal

" TypeScript
highlight default link typescriptEndColons Conceal
highlight default link typescriptParens Conceal
highlight default link typescriptBraces Conceal

" Git
highlight default link gitcommitWarning WarningMsg

" Fugitive
highlight default link FugitiveblameDelimiter Delimiter

" Ruby
highlight default link rubyStringDelimiter Conceal

" Vim
highlight default link vimParenSep Conceal

" Markdown
highlight default link mkdDelimiter Statement

" YAML
highlight default link yamlKeyValueDelimiter Statement
