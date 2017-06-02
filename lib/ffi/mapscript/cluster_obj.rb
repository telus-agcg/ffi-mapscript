require 'ffi'

module FFI
  module Mapscript
    extend FFI::Library

    class ClusterObj < FFI::Struct
      layout :max_distance, :double,
        :buffer, :double,
        :region, :string,
        :group, ExpressionObj,
        :filter, ExpressionObj
    end
  end
end
