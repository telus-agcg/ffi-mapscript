require 'ffi'

module FFI
  module Mapscript
    extend FFI::Library

    class TileCacheObj < FFI::Struct
      layout :symbol, SymbolObj.ptr,
        :width, :int,
        :height, :int,
        :color, ColorObj,
        :outline_color, ColorObj,
        :background_color, ColorObj,
        :outline_width, :double,
        :rotation, :double,
        :scale, :double,
        :image, ImageObj.ptr,
        :next, TileCacheObj.ptr
    end
  end
end
