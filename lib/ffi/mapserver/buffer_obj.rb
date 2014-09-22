require 'ffi'

module FFI
  module Mapserver
    extend FFI::Library

    class BufferObj < FFI::Struct
      layout :data, :buffer_inout,
        :size, :size_t,
        :available, :size_t,
        :_next_allocation_size, :size_t
    end
  end
end
