require 'ffi'


module FFI
  module Mapscript
    extend FFI::Library

    class ImageCacheObj < FFI::Struct
      layout :symbol, :int,
        :size, :int,
        :color, ColorObj,
        :outline_color, ColorObj,
        :background_color, ColorObj,
        :img, RasterBufferObj,
        :next, ImageCacheObj.ptr
    end
  end
end
