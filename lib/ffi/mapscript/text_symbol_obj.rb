require 'ffi'

module FFI
  module Mapscript
    extend FFI::Library
    class TextSymbolObj < FFI::Struct
      layout :label, LabelObj.ptr,
        :anno_text, :string,
        :scale_factor, :double,
        :resolution_factor, :double,
        :anno_point, PointObj,
        :rotation, :double,
        :text_path, TextPathObj.ptr,
        :label_bounds, :pointer
    end
  end
end
