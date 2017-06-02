require 'ffi'

module FFI
  module Mapscript
    extend FFI::Library

    class LabelStyleObj < FFI::Struct
      layout :fonts, [:string, MS_MAX_LABEL_FONTS],
        :num_fonts, :int,
        :size, :double,
        :rotation, :double,
        :color, ColorObj.ptr,
        :outline_width, :double,
        :outline_color, ColorObj.ptr
    end
  end
end
