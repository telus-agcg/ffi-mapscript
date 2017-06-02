require 'ffi'

module FFI
  module Mapscript
    extend FFI::Library

    class RGBAPixel < FFI::Struct
      layout :b, :uchar,
        :g, :uchar,
        :r, :uchar,
        :a, :uchar
    end
  end
end
