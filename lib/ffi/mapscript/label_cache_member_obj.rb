require 'ffi'

module FFI
  module Mapscript
    extend FFI::Library

    class LabelCacheMemberObj < FFI::Struct
      layout :styles, StyleObj.ptr,
        :num_styles, :int,
        :text_symbols, :pointer,    # array of TextSymbolObj
        :num_text_symbols, :int,
        :layer_index, :int,
        :class_index, :int,
        :shape_type, :int,
        :point, PointObj,
        :bbox, RectObj,
        :status, :int,
        :marker_id, :int,
        :leader_line, LineObj.ptr,
        :leader_box, RectObj.ptr
    end
  end
end
