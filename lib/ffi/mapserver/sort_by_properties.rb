require 'ffi'

module FFI
  module Mapserver
    extend FFI::Library
    class SortByProperties < FFI::Struct
      layout :item, :string,
      :sort_order, :SortOrderEnum
    end
  end
end
