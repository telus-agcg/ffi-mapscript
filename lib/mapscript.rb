module Mapscript
  class << self
    private

    def mapscript_path(path)
      File.expand_path(path, __dir__)
    end
  end

  autoload :CGIRequest,     mapscript_path('mapscript/cgi_request')
  autoload :MapFile,        mapscript_path('mapscript/map_file')
  autoload :MapFileObjects, mapscript_path('mapscript/map_file_objects')
  autoload :MapObj,         mapscript_path('mapscript/map_obj')
  autoload :ShapeObj,       mapscript_path('mapscript/shape_obj')
end

require_relative 'ffi/mapscript'
