require 'ffi'

module FFI
  module Mapserver
    extend FFI::Library

    class LabelLeaderObj < FFI::Struct
      layout :max_distance, :int,
        :grid_step, :int,
        :styles, :pointer,      # array of StyleObj
        :max_styles, :int,
        :num_styles, :int
    end
  end
end
