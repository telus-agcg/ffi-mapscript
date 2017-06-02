require 'ffi'

module FFI
  module Mapscript
    extend FFI::Library
    ffi_lib 'mapserver'

    attach_function :msIO_getHandler, [:string], MSIOContext.ptr
    #attach_function :msIO_getHandler, [:string], :pointer

    attach_function :msIO_resetHandlers, [], :void
    attach_function :msIO_installStdoutToBuffer, [], :void
    attach_function :msIO_installStdinFromBuffer, [], :void
    attach_function :msIO_Cleanup, [], :void

    attach_function :msIO_stripStdoutBufferContentType, [], :string
    attach_function :msIO_stripStdoutBufferContentHeaders, [], :void

    #attach_function :msIO_pushStdoutToBufferAndGetOldContext, [], :pointer
    #attach_function :msIO_restoreOldStdoutContext, [:pointer], :void

    #attach_function :msIO_isStdContext, [], :int

    attach_function :msIO_needBinaryStdout, [], :int
    attach_function :msIO_needBinaryStdin, [], :int
  end
end
