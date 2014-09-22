require 'ffi'

module FFI
  module Mapserver
    extend FFI::Library

    class WMSParamsObj < FFI::Struct
      layout :online_resource, :string,
        :params, HashTableObj.ptr,
        :num_params, :int,
        :http_cookie_data, :string
    end
  end
end
