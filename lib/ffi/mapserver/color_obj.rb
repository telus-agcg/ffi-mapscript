require 'ffi'

module FFI
  module Mapserver
    extend FFI::Library

    class ColorObj < FFI::Struct
      layout :red, :int,
        :green, :int,
        :blue, :int,
        :alpha, :int
    end
  end
end
