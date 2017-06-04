module Mapscript
  class ShapeObj
    def self.fromWKT(wkt)
      struct = FFI::Mapscript.msShapeFromWKT(wkt)
      struct = FFI::Mapscript.msOGRShapeFromWKT(wkt) if struct.null?
      raise "Can't parse WKT into shape" if struct.null?

      new(struct)
    end

    def initialize(struct)
      @c_struct = struct
    end
  end
end
