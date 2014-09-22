require 'ffi'

module FFI
  module Mapserver
    class FaceElement < FFI::Struct
      layout :font, :string,
        :face, :pointer,
        :index_cache, :pointer,
        :glyph_cache, :pointer,
        :outline_cache, :pointer,
        :hb_font, :pointer,
        :hh, :pointer
    end
  end
end
