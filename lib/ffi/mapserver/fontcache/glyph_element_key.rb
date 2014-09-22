require 'ffi'

module FFI
  module Mapserver
    class GlyphElementKey < FFI::Struct
      layout :code_point, :uint,
        :size, :uint
    end
  end
end
