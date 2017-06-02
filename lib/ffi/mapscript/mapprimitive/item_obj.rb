require 'ffi'

module FFI
  module Mapscript
    extend FFI::Library

    class ItemObj < FFI::Struct
      layout :name, :string,
        :type, :long,
        :index, :int,
        :size, :int,
        :num_decimals, :short
    end
  end
end
