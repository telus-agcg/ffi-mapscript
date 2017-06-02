require 'ffi'

module FFI
  module Mapscript
    extend FFI::Library
    class LegendObj < FFI::Struct
      layout :image_color, ColorObj,
      :label, LabelObj,
      :key_size_x, :int,
      :key_size_y, :int,
      :key_spacing_x, :int,
      :key_spacing_y, :int,
      :outline_color, ColorObj,
      :status, :int,
      :height, :int,
      :width, :int,
      :position, :int,
      :transparent, :int,
      :interlace, :int,
      :post_label_cache, :int,
      :template, :string,
      :map, MapObj.ptr
    end
  end
end
