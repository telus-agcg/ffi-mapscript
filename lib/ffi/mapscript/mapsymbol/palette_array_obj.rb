require 'ffi'

module FFI
  module Mapscript
    extend FFI::Library

    class PaletteArrayObj < FFI::Struct
      layout :pixels, :pointer,
        :palette, RGBAPixel.ptr,
        :num_entries, :uint,
        :scaling_maxval, :uint
    end
  end
end
