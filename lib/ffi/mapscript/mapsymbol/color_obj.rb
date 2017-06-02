require 'ffi'

module FFI
  module Mapscript
    extend FFI::Library

    class ColorObj < FFI::Struct
      layout :red, :int,
        :green, :int,
        :blue, :int,
        :alpha, :int
    end
  end
end
