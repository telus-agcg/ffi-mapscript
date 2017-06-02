require 'ffi'

module FFI
  module Mapscript
    extend FFI::Library

    class StyleObj < FFI::Struct
      layout :ref_count, :int,
        :_geotransform, ExpressionObj,
        :auto_angle, :int,
        :color, ColorObj,
        :background_color, ColorObj,
        :outline_color, ColorObj,
        :opacity, :int,
        :min_color, ColorObj,
        :max_color, ColorObj,
        :min_value, :double,
        :max_value, :double,
        :range_item, :string,
        :range_item_index, :int,
        :symbol, :int,
        :symbol_name, :string,
        :size, :double,
        :min_size, :double,
        :max_size, :double,
        :pattern_length, :int,
        #:pattern, [:double, MS_MAXPATTERNLENGTH],
        :gap, :double,
        :initial_gap, :double,
        :position, :int,
        :line_cap, :int,
        :line_join, :int,
        :width, :double,
        :outline_width, :double,
        :min_width, :double,
        :max_width, :double,
        :offset_x, :double,
        :offset_y, :double,
        :polar_offset_pixel, :double,
        :polar_offset_angle, :double,
        :angle, :double,
        :min_scale_denom, :double,
        :max_scale_denom, :double,
        :bindings, [AttributeBindingObj, MS_STYLE_BINDING_LENGTH],
        :num_bindings, :int
    end
  end
end
