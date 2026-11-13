if exists("b:current_syntax")
  finish
endif

" Load embedded YAML syntax for metadata blocks
silent! syntax include @evoxYaml syntax/yaml.vim
unlet! b:current_syntax

" Metadata block enclosed in ==
syntax region evoxMetadataRegion
      \ matchgroup=evoxMetadataDelimiter
      \ start=/^\s*==\s*$/
      \ end=/^\s*==\s*$/
      \ contains=@evoxYaml,evoxMetadataLine
      \ keepend

" Top-level and contained YAML metadata attributes (e.g. name: Free Falling)
syntax match evoxMetadataLine /^\s*\h\w*\s*:.*$/ contains=evoxMetadataKey,evoxMetadataColon
syntax match evoxMetadataKey /^\s*\h\w*/ contained nextgroup=evoxMetadataColon
syntax match evoxMetadataColon /:/ contained nextgroup=evoxMetadataNumber,evoxMetadataString skipwhite
syntax match evoxMetadataString /\S.*$/ contained
syntax match evoxMetadataNumber /\d\+\%(\.\d\+\)\?\s*$/ contained

" Column delimiters (--)
syntax match evoxColumnDelimiter /^\s*--\s*$/

" Chord lines: begin with a period (.) at column 0
syntax match evoxChordLine /^\..*$/ contains=evoxChordDot,evoxChord
syntax match evoxChord /\S\+/ contained
syntax match evoxChordDot /^\./ contained nextgroup=evoxChord skipwhite

" Lyric lines: begin with a space ( ), excluding indented -- or == delimiters
syntax match evoxLyricLine /^ \(\s*\(--\|==\)\s*$\)\@!.*$/ contains=evoxLyricLeadSpace
syntax match evoxLyricLeadSpace /^ / contained

" Link to standard Neovim / Treesitter highlight groups
highlight default link evoxMetadataDelimiter PreProc
highlight default link evoxMetadataKey       Identifier
highlight default link evoxMetadataColon     Delimiter
highlight default link evoxMetadataNumber    Number
highlight default link evoxMetadataString    Constant
highlight default link evoxColumnDelimiter   Delimiter
highlight default link evoxChordDot          SpecialChar
highlight default link evoxChord             Function
highlight default link evoxLyricLine         String
highlight default link evoxLyricLeadSpace    Whitespace

let b:current_syntax = "evox"
