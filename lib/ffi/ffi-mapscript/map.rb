# require_relative '../ffi-mapscript'

# module Mapscript
#   class Map
#     def initialize(path = nil)
#       @map_obj_ptr = if path
#         FFI::Mapscript.msLoadMap(path, nil)
#       else
#         FFI::Mapscript.msNewMapObj
#       end
#     end
#   end
# end
