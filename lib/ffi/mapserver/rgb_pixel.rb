require 'ffi'

module FFI
  module Mapserver
    extend FFI::Library

    class RGBPixel < FFI::Struct
      layout :r, :uchar,
        :g, :uchar,
        :b, :uchar
    end
  end
end
