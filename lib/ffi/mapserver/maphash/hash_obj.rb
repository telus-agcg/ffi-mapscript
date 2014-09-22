require 'ffi'

module FFI
  module Mapserver
    extend FFI::Library

    class HashObj < FFI::Struct
      layout :next, HashTableObj.ptr,
      :key, :string,
      :data, :string
    end
  end
end
