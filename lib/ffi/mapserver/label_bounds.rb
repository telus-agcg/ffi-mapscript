require 'ffi'

module FFI
  module Mapserver
    class LabelBounds < FFI::Struct
      layout :poly, LineObj.ptr,
        :bbox, RectObj
    end
  end
end
