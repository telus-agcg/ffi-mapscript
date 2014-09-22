require 'ffi'

module FFI
  module Mapserver
    extend FFI::Library

    class OWSRequestObj < FFI::Struct
      layout :num_layers, :int,
        :enabled_layers, :pointer,
        :service, :string,
        :version, :string,
        :request, :string,
        :document, :pointer
    end
  end
end
