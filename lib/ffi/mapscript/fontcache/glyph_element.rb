require 'ffi'

module FFI
  module Mapscript
    class GlyphElement < FFI::Struct
      layout :key, GlyphElementKey,
        :metrics, GlyphMetrics,
        :hh, :pointer
    end
  end
end
