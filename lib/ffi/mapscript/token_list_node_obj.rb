require 'ffi'

module FFI
  module Mapscript
    extend FFI::Library

    class TokenListNodeObj < FFI::Struct
      layout :token, :int,
        :token_val, TokenValueObj,
        :token_src, :string,
        :next, TokenListNodeObj.ptr,
        :tail_if_head, TokenListNodeObj.ptr
      end
    end
end
