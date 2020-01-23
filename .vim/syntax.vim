"{{ Javascript syntax hightlighting and indentation
Plug 'pangloss/vim-javascript'
" ---> Enable syntax for JSDOCS <---
  let g:javascript_plugin_jsdoc = 1
" ---> Enable code folding - careful with performance <---
  augroup javascript_folding
      au!
      au FileType javascript setlocal foldmethod=syntax
  augroup END
" ---> Concealing characters <---
  set conceallevel=1
  let g:javascript_conceal_function             = "ƒ"
  let g:javascript_conceal_arrow_function       = "⇒"
"}}

"{{ Jsx syntax highlighting and indentation
Plug 'MaxMEllon/vim-jsx-pretty'
"}}

"{{ Json syntax highlighting
Plug 'leshill/vim-json'
"}}

