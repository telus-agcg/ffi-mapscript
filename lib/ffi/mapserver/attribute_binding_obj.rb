require 'ffi'

module FFI
  module Mapserver
    extend FFI::Library

    class AttributeBindingObj < FFI::Struct
      layout :item, :string,
        :index, :int
    end
  end
end
