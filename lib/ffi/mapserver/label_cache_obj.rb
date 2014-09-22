require 'ffi'

module FFI
  module Mapserver
    extend FFI::Library
    
    class LabelCacheObj < FFI::Struct
      layout :slots, [LabelCacheSlotObj, MS_MAX_LABEL_PRIORITY],
        :gutter, :int,
        :rendered_text_symbols, :pointer,   # array of LabelCacheMemeberObj
        :num_allocated_rendered_members, :int,
        :num_rendered_members, :int
    end
  end
end
