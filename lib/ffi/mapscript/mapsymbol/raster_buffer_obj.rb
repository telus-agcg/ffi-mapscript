require 'ffi'

module FFI
  module Mapscript
    extend FFI::Library

    class RasterBufferObjData < FFI::Union
      layout :rgba, RGBAArrayObj,
        :palette, PaletteArrayObj
    end

    class RasterBufferObj < FFI::Struct
      layout :type, :int,
        :width, :uint,
        :height, :uint,
        :data, RasterBufferObjData
    end
  end
end
