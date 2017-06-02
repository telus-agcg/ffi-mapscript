require 'ffi'

module FFI
  module Mapscript
    extend FFI::Library
    class LayerVTableObj < FFI::Struct
      layout :layer_translate_filter, :pointer,
      :layer_supports_common_filters, :pointer,
      :layer_init_item_info, :pointer,
      :layer_free_item_info, :pointer,
      :layer_open, :pointer,
      :layer_is_open, :pointer,
      :layer_which_shapes, :pointer,
      :layer_next_shape, :pointer,
      :layer_get_shape, :pointer,
      :layer_close, :pointer,
      :layer_get_items, :pointer,
      :layer_get_extent, :pointer,
      :layer_get_auto_style, :pointer,
      :layer_close_connection, :pointer,
      :layer_set_time_filter, :pointer,
      :layer_apply_filter_to_layer, :pointer,
      :layer_create_items, :pointer,
      :layer_get_num_features, :pointer,
      :layer_get_auto_projection, :pointer,
      :layer_escape_sql_param, :pointer,
      :layer_enable_paging, :pointer,
      :layer_get_paging, :pointer
    end
  end
end
