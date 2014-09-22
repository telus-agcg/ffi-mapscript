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
      FFI::Mapserver.loadParams(@cgi_request_obj_ptr,
        nil,
        '',
        0,
        nil)
    end
  end
end
