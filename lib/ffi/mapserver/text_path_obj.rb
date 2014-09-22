require 'ffi'

module FFI
  module Mapserver
    class TextPathObj < FFI::Struct
      layout :num_glyphs, :int,
        :num_lines, :int,
        :line_height, :int,
        :glyph_size, :int,
        :absolute, :int,
        :glyphs, GlyphObj.ptr,
        :bounds, LabelBounds
    end
  end
end
