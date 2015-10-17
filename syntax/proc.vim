if exists("b:current_syntax")
  finish
endif

" Source the C syntax
runtime! syntax/c.vim
unlet b:current_syntax

" Get the SQL syntax into a group
let b:current_syntax_contain = 1 "Don't delete the previously sourced C syntax
syntax include @SQL syntax/sql.vim
unlet b:current_syntax_contain

" PRO*C Modifications
syntax match procDelimiters "\v\c^\s*<exec>\s*<sql>"
syntax match procDelimiters "\v\c^\s*<exec>\s*<sql>\s*<execute>"
syntax match procDelimiters "\v\s*\c<end-exec>\s*;\s*$"

syntax region procMultiline start="\v\c^\s*<exec>\s*<sql>" end=";\s*$" contains=@SQL
syntax region procBlock start="\v\c^\s*<exec>\s*<sql>\s*<execute>" end="\v\c<end-exec>\ze\s*;\s*$" contains=@SQL

" Higlights
hi link procDelimiters Underlined

" Administrativia
let b:current_syntax = 'proc'
