require 'ffi'

module FFI
  module Mapserver
    extend FFI::Library
      
    class ResultObj < FFI::Struct
      layout :shape_index, :long,
        :tile_index, :int,
        :result_index, :int,
        :class_index, :int
    end
  end
end
