require 'ffi'

module FFI
  module Mapserver
    extend FFI::Library
    
    class SymbolSetObj < FFI::Struct
      layout :file_name, :string,
      :image_cache_size, :int,
      :num_symbols, :int,
      :max_symbols, :int,
      :ref_count, :int,
      :symbol, :pointer,    #  array of SymbolObj
      :map, MapObj.ptr,
      :font_set, FontSetObj.ptr,
      :image_cache, ImageCacheObj.ptr
    end
  end
end
