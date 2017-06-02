require 'ffi'

module FFI
  module Mapscript
    extend FFI::Library

    class GeotransformObj < FFI::Struct
      layout :need_geotransform, :int,
        :rotation_angle, :double,
        :geotransform, [:double, 6],
        :inv_geotransform, [:double, 6]
    end
  end
end
