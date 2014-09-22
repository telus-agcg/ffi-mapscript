require 'ffi'

module FFI
  module Mapserver
    extend FFI::Library

    class WebObj < FFI::Struct
      layout :log, :string,
        :image_path, :string,
        :image_url, :string,
        :temp_path, :string,
        :map, MapObj.ptr,
        :template, :string,
        :header, :string,
        :footer, :string,
        :empty, :string,
        :error, :string,
        :extent, RectObj,
        :min_scale_denom, :double,
        :max_scale_denom, :double,
        :min_template, :string,
        :max_template, :string,
        :query_format, :string,
        :lengend_format, :string,
        :browse_format, :string,
        :metadata, HashTableObj,
        :validation, HashTableObj
    end
  end
end
