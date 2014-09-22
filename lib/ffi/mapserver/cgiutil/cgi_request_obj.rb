require 'ffi'

module FFI
  module Mapserver
    # In the SWIG interface, this is renamed to OWSRequest.
    class CGIRequestObj < FFI::Struct
      layout :param_names, :pointer,    # array of string
        :param_values, :pointer,        # array of string
        :num_params, :int,
        :type, MS_REQUEST_TYPE,
        :content_type, :string,
        :post_request, :string,
        :http_cookie_data, :string
    end
  end
end
