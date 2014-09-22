require 'ffi'

module FFI
  module Mapserver
    extend FFI::Library
    ffi_lib 'mapserver'

    attach_function :msAllocCgiObj, [], CGIRequestObj.ptr

    attach_function :loadParams,
      [CGIRequestObj.ptr, :pointer, :string, :ms_uint32, :pointer],
      :int
  end
end
