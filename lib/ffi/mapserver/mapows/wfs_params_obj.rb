require 'ffi'

module FFI
  module Mapserver
    extend FFI::Library

    class WFSParamsObj < FFI::Struct
      layout :version, :string,
        :update_sequence, :string,
        :request, :string,
        :service, :string,
        :type_name, :string,
        :filter, :string,
        :filter_language, :string,
        :geometry_name, :string,
        :max_features, :int,
        :bbox, :string,
        :output_format, :string,
        :feature_id, :string,
        :srs, :string,
        :result_type, :string,
        :property_name, :string,
        :start_index, :int,
        :accept_versions, :string,
        :sections, :string,
        :sort_by, :string,
        :language, :string,
        :value_reference, :string,
        :psz_sotrted_query_id, :string,
        :count_get_feature_by_id, :int,
        :has_post_stored_query, :int
    end
  end
end
