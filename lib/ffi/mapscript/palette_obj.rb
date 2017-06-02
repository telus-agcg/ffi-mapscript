require 'ffi'

module FFI
  module Mapscript
    extend FFI::Library
    
    class PaletteObj < FFI::Struct
      layout :colors, [ColorObj, MS_MAXCOLORS - 1],
        :color_value, [:int, MS_MAXCOLORS - 1],
        :num_colors, :int
    end
  end
end
