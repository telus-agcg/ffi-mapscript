require 'ffi'

module FFI
  module Mapscript
    extend FFI::Library

    class PointObj < FFI::Struct
      layout :x, :double,
        :y, :double,
        :z, :double,
        :m, :double
    end
  end
end
