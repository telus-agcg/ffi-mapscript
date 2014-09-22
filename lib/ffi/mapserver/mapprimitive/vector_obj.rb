require 'ffi'

module FFI
  module Mapserver
    extend FFI::Library

    class VectorObj < FFI::Struct
      layout :x, :double,
        :y, :double
    end
  end
end
