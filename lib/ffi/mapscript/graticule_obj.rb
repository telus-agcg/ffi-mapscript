require 'ffi'

module FFI
  module Mapscript
    extend FFI::Library

    class GraticuleObj < FFI::Struct
      layout :which_latitude, :double,
        :which_longitude, :double,
        :start_latitude, :double,
        :start_longitude, :double,
        :end_latidutde, :double,
        :end_longitude, :double,
        :increment_latitude, :double,
        :increment_longitude, :double,
        :min_arcs, :double,
        :max_arcs, :double,
        :min_increment, :double,
        :max_increment, :double,
        :min_subdivides, :double,
        :max_subdivides, :double,
        :b_vertical, :int,
        :b_label_axes, :int,
        :i_label_state, :int,
        :i_label_type, :int,
        :extend, RectObj,
        :bounding_lines, LineObj.ptr,
        :bounding_points, PointObj.ptr,
        :label_format, :string
    end
  end
end
