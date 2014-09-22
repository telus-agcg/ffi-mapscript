require 'ffi'

module FFI
  module Mapserver
    extend FFI::Library

    class ProjectionObj < FFI::Struct
      layout :num_args, :int,
        :automatic, :int,
        :args, :pointer,    # array of strings
        :proj, :pointer,
        :geotransform, GeotransformObj,
        :well_known_projection, :int
    end
  end
end
