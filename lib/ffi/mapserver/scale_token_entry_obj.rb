require 'ffi'

module FFI
  module Mapserver
    extend FFI::Library
    class ScaleTokenEntryObj < FFI::Struct
      layout :min_scale, :double,
      :max_scale, :double,
      :value, :string
    end
  end
end
