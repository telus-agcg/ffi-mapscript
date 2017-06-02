require 'ffi'

module FFI
  module Mapscript
    extend FFI::Library

    class VectorObj < FFI::Struct
      layout :x, :double,
        :y, :double
    end
  end
end
