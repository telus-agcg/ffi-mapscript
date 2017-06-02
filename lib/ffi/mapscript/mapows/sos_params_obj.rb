require 'ffi'

module FFI
  module Mapscript
    extend FFI::Library

    class SOSParamsObj < FFI::Struct
      layout :version, :string,
        :accept_versions, :string,
        :update_sequence, :string,
        :request, :string,
        :service, :string,
        :output_format, :string,
        :sensor_id, :string,
        :procedure, :string,
        :offering, :string,
        :observed_property, :string,
        :event_time, :string,
        :result, :string,
        :response_format, :string,
        :result_model, :string,
        :response_mode, :string,
        :bbox, :string,
        :feature_of_interest, :string,
        :srs_name, :string
    end
  end
end
