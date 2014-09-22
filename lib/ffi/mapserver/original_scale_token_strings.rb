require 'ffi'

module FFI
  module Mapserver
    extend FFI::Library
    class OriginalScaleTokenStrings < FFI::Struct
      layout :data, :string,
      :tile_item, :string,
      :tile_index, :string,
      :filter_item, :string,
      :filter, :string,
      :processing, :pointer,    # array of strings?
      :processing_idx, :pointer,
      :n_processing, :int
    end
  end
end
