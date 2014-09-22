require 'ffi'

module FFI
  module Mapserver
    extend FFI::Library

    class MarkerCacheMemberObj < FFI::Struct
      layout :id, :int,
        :bounds, RectObj
    end
  end
end
