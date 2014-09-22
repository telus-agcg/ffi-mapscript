require_relative '../ffi-mapserver'

module Mapserver
  class Map
    def initialize(path = nil)
      @map_obj_ptr = if path
        FFI::Mapserver.msLoadMap(path, nil)
      else
        FFI::Mapserver.msNewMapObj
      end
    end

    # @param ows_mode [Boolean]
    # @return [FFI::Mapserver::MS_RETURN_VALUE]
    def ows_dispatch(cgi_request_obj, ows_mode = true)
      request_obj = if cgi_request_obj.is_a? Mapserver::CGIRequest
        cgi_request_obj.c_pointer
      elsif cgi_request_obj.is_a? FFI::Mapserver::CGIRequestObj
        cgi_request_obj
      end

      mode = ows_mode ? 1 : 0
      return_value = FFI::Mapserver.msOWSDispatch(@map_obj_ptr, cgi_request_obj, mode)
      case FFI::Mapserver::MS_RETURN_VALUE[return_value]
      when :MS_DONE
        nil
      when :MS_SUCCESS
        true
      when :MS_FAILURE
        raise 'OWS request failed to process.'
      end
    end
  end
end
