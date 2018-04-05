module Mapscript
  class ShapeObj
    class << self
      def from_wkt(wkt)
        struct = FFI::Mapscript.msShapeFromWKT(wkt)
        struct = FFI::Mapscript.msOGRShapeFromWKT(wkt) if struct.null?
        raise "Can't parse WKT into shape" if struct.null?

        new(struct)
      end
      alias_method :fromWKT, :from_wkt
    end

    attr_reader :c_struct

    def initialize(struct)
      @c_struct = struct
    end

    def index
      @c_struct[:index]
    end

    def index=(new_index)
      @c_struct[:index] = new_index
    end
  end
end
