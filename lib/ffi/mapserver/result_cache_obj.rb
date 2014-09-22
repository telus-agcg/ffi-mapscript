require 'ffi'

module FFI
  module Mapserver
    extend FFI::Library
    
    class ResultCacheObj < FFI::Struct
      layout :results, ResultObj.ptr,
      :cache_size, :int,
      :num_results, :int,
      :bounds, RectObj,
      :previous_bounds, RectObj,
      :use_get_shape, :int
    end
  end
end
