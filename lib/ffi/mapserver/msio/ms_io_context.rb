require 'ffi'

module FFI
  module Mapserver
    class MSIOContext < FFI::Struct
      layout :label, :string,
        :write_channel, :int,   # 1 = stdout/err, 0 = stdin
        :read_write_func, :pointer,    # msIO_llReadWriteFunc
        :data, :pointer
    end
  end
end
