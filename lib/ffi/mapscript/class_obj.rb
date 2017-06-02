require 'ffi'

module FFI
  module Mapscript
    extend FFI::Library

    class ClassObj < FFI::Struct
      layout :expression, ExpressionObj,
        :status, :int,
        :styles, :pointer,    # array of StyleObj
        :max_styles, :int,
        :num_styles, :int,
        :labels, :pointer,    # array of LabelObj
        :max_labels, :int,
        :num_labels, :int,
        :name, :string,
        :title, :string,
        :text, ExpressionObj,
        :template, :string,
        :metadata, HashTableObj,
        :validation, HashTableObj,
        :min_scale_denom, :double,
        :max_scale_denom, :double,
        :min_feature_size, :int,
        :ref_count, :int,
        :layer, LayerObj.ptr,
        :debug, :int,
        :key_image, :string,
        :group, :string,
        :leader, LabelLeaderObj.ptr
    end
  end
end
