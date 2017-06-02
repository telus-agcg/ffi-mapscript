require 'ffi'

module FFI
  module Mapscript
    class GlyphMetrics < FFI::Struct
      layout :min_x, :double,
        :min_y, :double,
        :max_x, :double,
        :max_y, :double,
        :advance, :double
    end
  end
end
