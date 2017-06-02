require 'ffi'

module FFI
  module Mapscript
    extend FFI::Library

    class MarkerCacheMemberObj < FFI::Struct
      layout :id, :int,
        :bounds, RectObj
    end
  end
end
