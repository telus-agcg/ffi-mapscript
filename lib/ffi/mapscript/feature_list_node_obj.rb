require 'ffi'

module FFI
  module Mapscript
    extend FFI::Library

    class FeatureListNodeObj < FFI::Struct
      layout :shape, ShapeObj,
        :next, FeatureListNodeObj.ptr,
        :tail_if_head, FeatureListNodeObj.ptr
    end
  end
end
