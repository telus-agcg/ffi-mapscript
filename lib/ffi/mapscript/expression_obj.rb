require 'ffi'

module FFI
  module Mapscript
    extend FFI::Library

    class ExpressionObj < FFI::Struct
      layout :string, :string,
      :type, :int,
      :flags, :int,
      :tokens, TokenListNodeObj.ptr,
      :cur_token, TokenListNodeObj.ptr,
      :regex, MSRegexT,
      :compiled, :int,
      :native_string, :string
    end
  end
end
