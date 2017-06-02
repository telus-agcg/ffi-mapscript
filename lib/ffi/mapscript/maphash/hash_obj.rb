require 'ffi'

module FFI
  module Mapscript
    extend FFI::Library

    class HashObj < FFI::Struct
      layout :next, HashTableObj.ptr,
      :key, :string,
      :data, :string
    end
  end
end
