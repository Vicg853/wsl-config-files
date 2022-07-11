"Keymaps
" Ctrl_a - Provide spellchecker recommendations

let g:coc_global_extensions = ['coc-json',
\ 'coc-tsserver',
\ 'coc-sh',
\ 'coc-deno',
\ 'coc-docker',
\ 'coc-eslint',
\ 'coc-sql',
\ 'coc-sql',
\ 'coc-svg',
\ 'coc-toml',
\ 'coc-yaml',
\ 'coc-yaml',
\ 'coc-stylelint',
\ 'coc-rust-analyzer',
\ 'coc-json',
\ 'coc-css',
\ 'coc-html',
\ 'coc-go',
\ 'coc-spell-checker',
\ 'coc-styled-components',
\]

"-- Coc spell checker keymaps
vmap <C-c>a <Plug>(coc-codeaction-selected)
nmap <C-c>a <Plug>(coc-codeaction-selected)

"-- Coc spell checker config
"--- --- Adding alternate languages
call coc#config('cSpellExt.enableDictionaries', [
  \ "french",
  \ "portuguese-brazilian"
  \])
"--- --- Activating external languages
call coc#config('cSpell.language', [
  \ "en",
  \ "pt_BR",
  \ "fr"
  \])

call coc#config("cSpell.numSuggestions", 8)