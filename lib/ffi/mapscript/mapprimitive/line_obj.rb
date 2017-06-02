require 'ffi'

module FFI
  module Mapscript
    extend FFI::Library

    class LineObj < FFI::Struct
      layout :num_points, :int,
        :point, PointObj.ptr
    end
  end
end
