require 'ffi'

module FFI
  module Mapscript
    extend FFI::Library

    class ShapeObj < FFI::Struct
      layout :num_lines, :int,
        :num_values, :int,
        :line, LineObj.ptr,
        :values, :pointer,      # array of strings
        :geometry, :pointer,
        :renderer_cache, :pointer,
        :bounds, RectObj,
        :type, MS_SHAPE_TYPE,
        :index, :long,
        :title_index, :int,
        :class_index, :int,
        :text, :string,
        :scratch, :int,
        :result_index, :int
    end
  end
end
