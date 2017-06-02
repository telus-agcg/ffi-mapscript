require 'ffi'

module FFI
  module Mapscript
    extend FFI::Library

    class ScalebarObj < FFI::Struct
      layout :image_color, ColorObj,
        :height, :int,
        :width, :int,
        :style, :int,
        :intervals, :int,
        :label, LabelObj,
        :color, ColorObj,
        :background_color, ColorObj,
        :outline_color, ColorObj,
        :units, :int,
        :status, :int,
        :position, :int,
        :transparent, :int,
        :interlace, :int,
        :post_label_cache, :int,
        :align, :int
    end
  end
end
