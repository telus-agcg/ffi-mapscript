require_relative '../ffi-mapserver'

module Mapserver
  class CGIRequest
    def initialize
      @cgi_request_obj_ptr = FFI::Mapserver.msAllocCgiObj
    end

    def c_pointer
      @cgi_request_obj_ptr
    end

    def load_params
      @post_data = ''

      FFI::Mapserver.loadParams(@cgi_request_obj_ptr,
        nil,
        @post_data,
        @post_data.size,
        nil)

      puts "posts data: #{@post_data}"
    end

    #
    def read_from_stdout(map)
      FFI::Mapserver.msIO_installStdoutToBuffer
      return_value = map.ows_dispatch(c_pointer)
      puts "return value: #{return_value}"

      content_type = FFI::Mapserver.msIO_stripStdoutBufferContentType
      #map_image = FFI::Mapserver.msIO_getStdoutBufferBytes
      map_image = get_stdout_buffer_string
      FFI::Mapserver.msIO_resetHandlers

      yield(map_image, content_type, return_value)
    end

    private

    def get_stdout_buffer_string
      io_context = FFI::Mapserver.msIO_getHandler('stdout')
      p io_context
      io_buffer = FFI::Mapserver::MSIOBuffer.ptr
      p io_buffer
    end
  end
end
