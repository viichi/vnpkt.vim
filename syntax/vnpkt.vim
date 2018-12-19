if exists("b:current_syntax")
    finish
endif


syn keyword vnpktPacketType request response packet nextgroup=vnpktPacketId skipwhite skipempty
syn keyword vnpktBasicType bool i8 u8 i16 u16 i32 u32 i64 u64 f32 f64 int uint float double string
syn keyword vnpktArrayType vector array
syn keyword vnpktOption option

syn keyword vnpktStructure struct enum nextgroup=vnpktIdentifier skipwhite skipempty

syn match vnpktIdentifier "\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*" display contained

syn match vnpktDecNumber   display "\<[0-9]\+" contained
syn match vnpktHexNumber   display "\<0x[a-fA-F0-9]\+" contained

syn region vnpktPacketId start="<" end=">" contains=vnpktDecNumber,vnpktHexNumber nextgroup=vnpktIdentifier skipwhite skipempty

syn region vnpktCommentLine start="//" end="$" contains=vnpktTodo,@Spell
syn region vnpktCommentBlock start="/\*" end="\*/" contains=vnpktTodo,@Spell

syn keyword vnpktTodo contained TODO FIXME XXX NB NOTE

hi def link vnpktPacketType         Keyword
hi def link vnpktStructure          Keyword
hi def link vnpktBasicType          Type
hi def link vnpktArrayType          Type
hi def link vnpktOption             Keyword
hi def link vnpktDecNumber          Number
hi def link vnpktHexNumber          Number
hi def link vnpktCommentLine        Comment
hi def link vnpktCommentBlock       Comment
hi def link vnpktTodo               Todo
"hi def link vnpktIdentifierPrime    Identifier
hi def link vnpktIdentifier         Identifier

let b:current_syntax = "vnpkt"