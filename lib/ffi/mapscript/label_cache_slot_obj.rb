require 'ffi'

module FFI
  module Mapscript
    extend FFI::Library

    class LabelCacheSlotObj < FFI::Struct
      layout :labels, LabelCacheMemberObj.ptr,
        :num_labels, :int,
        :cache_size, :int,
        :markers, MarkerCacheMemberObj.ptr,
        :num_markers, :int,
        :marker_cache_size, :int
    end
  end
end
