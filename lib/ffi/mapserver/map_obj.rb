require 'ffi'

module FFI
  module Mapserver
    class MapObj < FFI::Struct
      layout :name, :string,
        :status, :int,
        :height, :int,
        :width, :int,
        :max_size, :int,
        :layers, :pointer,    # an array of LayerObjs
        :ref_count, :int,
        :num_layers, :int,
        :max_layers, :int,
        :symbol_set, SymbolSetObj,
        :font_set, FontSetObj,
        :label_cache, LabelCacheObj,
        :transparent, :int,
        :interlace, :int,
        :image_quality, :int,
        :extend, RectObj,
        :cell_size, :double,
        :geotransform, GeotransformObj,
        :saved_extend, RectObj,
        :units, MS_UNITS,
        :scale_denom, :double,
        :resolution, :double,
        :default_resolution, :double,
        :shape_path, :string,
        :map_path, :string,
        :palette, PaletteObj,
        :image_color, ColorObj,
        :num_output_formats, :int,
        :output_format_list, :pointer,   # an array of OutputFormatObjs
        :output_format, OutputFormatObj.ptr,
        :image_type, :string,
        :projection, ProjectionObj,
        :lat_lon, ProjectionObj,
        :reference, ReferenceMapObj,
        :scale_bar, ScalebarObj,
        :legend, LegendObj,
        :query_map, QueryMapObj,
        :web, WebObj,
        :layer_order, :pointer,     # to an int
        :debug, :int,
        :data_pattern, :string,
        :template_pattern, :string,
        :config_options, HashTableObj,
        :encryption_key_loaded, :int,
        :encryption_key, [:uchar, MS_ENCRYPTION_KEY_SIZE],
        :query, QueryObj
    end
  end
end
