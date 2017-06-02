require 'ffi'

module FFI
  module Mapscript
    extend FFI::Library
    class SortByProperties < FFI::Struct
      layout :item, :string,
      :sort_order, SortOrderEnum
    end
  end
end
