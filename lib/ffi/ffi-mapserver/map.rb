require_relative '../ffi-mapserver'

module Mapserver
  class Map
    def initialize(path = nil)
      @map_obj_ptr = if path
        FFI::Mapserver.msLoadMap(path, nil)
      else
        FFI::Mapserver.msNewMapObj
      end
    end
  end
end
