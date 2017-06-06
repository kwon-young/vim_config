" Vim syntax file
" Language:     LambdaProlog (pm)
" Filenames:    *.pm *.type *.epf
" Maintainer:   Markus Mottl  <markus.mottl@gmail.com>
" URL:          http://www.ocaml.info/vim/syntax/lambdaprolog.vim
" Last Change:  2006 Feb 05
"               2001 Apr 26 - Upgraded for new Vim version
"               2000 Jun  5 - Initial release

" quit when a syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

" Lambda Prolog is case sensitive.
syn case match

syn spell notoplevel

syn region  lambdaprologComment  start="/\*" end="\*/" contains=lambdaprologComment,lambdaprologTodo
syn region  lambdaprologComment  start="%" end="$" contains=lambdaprologTodo
syn keyword lambdaprologTodo  contained TODO FIXME XXX

syn match lambdaprologTypeName "\<[a-z]\w\+T\>"
syn match lambdaprologVariable "\<\(\u\|_\)[a-zA-Z0-9_]*\>"
syn match lambdaprologCond "\<\(no\)\?[cC]ond\w\+\>"
syn match lambdaprologConstructor "\<[a-z]\w\+C\>"

syn region  lambdaprologString   start=+"+ skip=+\\\\\|\\"+ end=+"+
syn match   lambdaprologInteger  "\<\d\+\>"
syn match   lambdaprologReal     "\<\(\d\+\)\=\.\d+\>"

syn match lambdaprologInclude "^#\<include\>" skipwhite nextgroup=lambdaprologString
syn match lambdaprologInclude "^#\<define\>" skipwhite nextgroup=lambdaprologString

syn match lambdaprologKeyword "^\<import\>"

syn match   lambdaprologBrackErr    "\]"
syn match   lambdaprologParenErr    ")"

syn region  lambdaprologEncl transparent matchgroup=lambdaprologKeyword start="(" matchgroup=lambdaprologKeyword end=")"
syn region  lambdaprologEncl transparent matchgroup=lambdaprologKeyword start="\[" matchgroup=lambdaprologKeyword end="\]"

syn match lambdaprologOperator "->"
syn match lambdaprologOperator ":-"
syn match lambdaprologOperator "::="
syn match lambdaprologOperator ">"
syn match lambdaprologOperator "<"
syn match lambdaprologOperator ">="
syn match lambdaprologOperator "=<"
syn match lambdaprologOperator "//"
syn match lambdaprologOperator "$/"
syn match lambdaprologOperator "-"
syn match lambdaprologOperator "+"
syn match lambdaprologOperator "*"
syn match lambdaprologOperator "@"
syn match lambdaprologKeyword "?"
syn match lambdaprologKeyword "\."
syn match lambdaprologKeyword "``"
syn match lambdaprologKeyword "&&"
syn match lambdaprologKeyword "=>"
syn match lambdaprologKeyword "==>"
syn match lambdaprologBoolean "!"
syn keyword lambdaprologOperator is
syn keyword lambdaprologKeyword export kind type use dynamic
syn keyword lambdaprologDMOSOperator AT TERM_SEG TEST USE_LAYER IN AT_ABS FIND UNTIL LOAD_MEM SAVE_MEM
syn keyword lambdaprologStdPredicate length member append
syn keyword lambdaprologBoolean true false

syn sync minlines=50
syn sync maxlines=500


hi def link lambdaprologComment     Comment
hi def link lambdaprologTodo	    Todo

hi def link lambdaprologKeyword     Keyword
hi def link lambdaprologTypeName    Type
hi def link lambdaprologOperator     Operator
hi def link lambdaprologString      String
hi def link lambdaprologInteger     Number
hi def link lambdaprologReal        Float
hi def link lambdaprologVariable    Identifier
hi def link lambdaprologBoolean     Boolean
hi def link lambdaprologCond        Conditional
hi def link lambdaprologConstructor Function

hi def link lambdaprologCommentErr  Error
hi def link lambdaprologBrackErr    Error
hi def link lambdaprologParenErr    Error

hi def link lambdaprologInclude Include
hi def link lambdaprologDMOSOperator Label
hi def link lambdaprologStdPredicate Function
let b:current_syntax = "lambdaprolog"

" vim: ts=8
