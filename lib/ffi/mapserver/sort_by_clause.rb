require 'ffi'

module FFI
  module Mapserver
    extend FFI::Library
    class SortByClause < FFI::Struct
      layout :n_properties, :int,
      :properties, SortByProperties.ptr
    end
  end
end
