require 'ffi'

module FFI
  module Mapscript
    extend FFI::Library

    class AttributeBindingObj < FFI::Struct
      layout :item, :string,
        :index, :int
    end
  end
end
