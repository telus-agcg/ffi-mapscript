require 'ffi'

module FFI
  module Mapscript
    class LabelBounds < FFI::Struct
      layout :poly, LineObj.ptr,
        :bbox, RectObj
    end
  end
end
