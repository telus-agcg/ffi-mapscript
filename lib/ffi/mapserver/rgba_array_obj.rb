require 'ffi'

module FFI
  module Mapserver
    extend FFI::Library

    class RGBAArrayObj < FFI::Struct
      layout :pixels, :pointer,
        :pixel_step, :int,
        :row_step, :int,
        :a, :pointer,
        :r, :pointer,
        :g, :pointer,
        :b, :pointer
    end
  end
end
