require 'ffi'

module FFI
  module Mapscript
    extend FFI::Library

    class QueryObj < FFI::Struct
      layout :type, MS_QUERY_TYPE,
        :mode, MS_QUERY_MODE,
        :layer, :int,
        :point, PointObj,
        :buffer, :double,
        :max_results, :int,
        :rect, RectObj,
        :shape, ShapeObj.ptr,
        :shape_index, :long,
        :tile_index, :long,
        :clear_result_cache, :int,
        :max_features, :int,
        :start_index, :int,
        :only_cache_result_count, :int,
        :filter, ExpressionObj,
        :filter_item, :string,
        :selection_layer, :int
    end
  end
end
