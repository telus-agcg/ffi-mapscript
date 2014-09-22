require 'ffi'

module FFI
  module Mapserver
    class GlyphObj < FFI::Struct
      layout :glyph, GlyphElement.ptr,
        :face, FaceElement.ptr,
        :pnt, PointObj,
        :rot, :double
    end
  end
end
