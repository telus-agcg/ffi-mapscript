require 'ffi'

module FFI
  module Mapscript
    class TokenValueObj < FFI::Union
      layout :dbl_val, :double,
        :int_val, :int,
        :str_val, :string,
        :tm_val, FFI::LibC::TM,
        :shp_val, ShapeObj.ptr,
        :bind_val, AttributeBindingObj
    end
  end
end
