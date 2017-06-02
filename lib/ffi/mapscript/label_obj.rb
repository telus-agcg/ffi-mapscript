require 'ffi'

module FFI
  module Mapscript
    extend FFI::Library

    class LabelObj < FFI::Struct
      layout :ref_count, :int,
        :font, :string,
        :color, ColorObj,
        :outline_color, ColorObj,
        :outline_width, :int,
        :shadow_color, ColorObj,
        :shadow_size_x, :int,
        :shadow_size_y, :int,
        :size, :int,
        :min_size, :int,
        :max_size, :int,
        :position, :int,
        :offset_x, :int,
        :offset_y, :int,
        :angle, :double,
        :angle_mode, MS_POSITIONS_ENUM,
        :buffer, :int,
        :align, :int,
        :wrap, :char,
        :max_length, :int,
        :min_length, :int,
        :space_size_10, :double,
        :min_feature_size, :int,
        :auto_min_feature_size, :int,
        :min_scale_denom, :double,
        :max_scale_denom, :double,
        :min_distance, :int,
        :repeat_distance, :int,
        :max_overlap_angle, :double,
        :partials, :int,
        :force, :int,
        :encoding, :string,
        :priority, :int,
        :expression, ExpressionObj,
        :text, ExpressionObj,
        :styles, :pointer,      # array of StyleObj
        :max_styles, :int,
        :num_styles, :int,
        :bindings, [AttributeBindingObj, MS_LABEL_BINDING_LENGTH],
        :num_bindings, :int,
        :leader, LabelLeaderObj.ptr
    end
  end
end
