require 'ffi'

module FFI
  module Mapserver
    class MSIOBuffer < FFI::Struct
      layout :data, :uchar,
        :data_len, :int,
        :data_offset, :int
    end
  end
end
