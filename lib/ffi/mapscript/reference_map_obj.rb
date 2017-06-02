require 'ffi'

module FFI
  module Mapscript
    extend FFI::Library
    
    class ReferenceMapObj < FFI::Struct
      layout :extent, RectObj,
      :height, :int,
      :width, :int,
      :color, ColorObj,
      :outline_color, ColorObj,
      :image, :string,     # should this be a :buffer?
      :status, :int,
      :marker, :int,
      :marker_name, :string,
      :marker_size, :int,
      :min_box_size, :int,
      :max_box_size, :int,
      :map, MapObj.ptr
    end
  end
end
