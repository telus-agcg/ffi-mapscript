require 'ffi'

module FFI
  module Mapserver
    extend FFI::Library

    class PointObj < FFI::Struct
      layout :x, :double,
        :y, :double,
        :z, :double,
        :m, :double
    end
  end
end
