require 'ffi'


module FFI
  module Mapscript
    extend FFI::Library

    class HashTableObj < FFI::Struct
      layout :items, :pointer,    # array of HashObject
      :num_items, :int
    end
  end
end
