" Vim syntax file
" Language:    R noweb rst Files
" Last Change: 2010 Sept. 10
" Version:     0.1
" Remarks:     - Inspired by rnoweb.vim
"

" Version Clears: {{{1
" For version 5.x: Clear all syntax items
" For version 6.x and 7.x: Quit when a syntax file was already loaded
if version < 600 
  syntax clear
elseif exists("b:current_syntax")
  finish
endif 

syn case match

runtime syntax/rst.vim
unlet b:current_syntax
syn cluster rstCruft add=@rnoweb
syn cluster rstDirectives add=rnoweb


" Highlighting of R code using an existing r.vim syntax file if available {{{1
syn include @rnowebR syntax/r.vim
syn region rnowebChunk matchgroup=rnowebDelimiter start="^<<.*>>=" matchgroup=rnowebDelimiter end="^@" contains=@rnowebR,rnowebChunkReference,rnowebChunk fold keepend
syn match rnowebChunkReference "^<<.*>>$" contained
syn region rnowebSexpr matchgroup=Delimiter start="\\Sexpr{" matchgroup=Delimiter end="}" contains=@rnowebR

" Sweave options command {{{1
syn region rnowebSweaveopts matchgroup=Delimiter start="\\SweaveOpts{" matchgroup=Delimiter end="}"

" pynoweb Cluster {{{1
syn cluster rnoweb contains=rnowebChunk,rnowebChunkReference,rnowebDelimiter,rnowebSexpr,rnowebSweaveopts

" Highlighting {{{1
hi def link rnowebDelimiter	Delimiter
hi def link rnowebSweaveOpts Statement
hi def link rnowebChunkReference Delimiter

let   b:current_syntax = "rrstnoweb"
" vim: foldmethod=marker:
