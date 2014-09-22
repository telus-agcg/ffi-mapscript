require 'ffi'
require_relative 'mapserver/version'

module FFI
  module Mapserver
    extend FFI::Library

    ffi_lib 'mapserver'
    ffi_lib 'libc'

    MS_LABEL_BINDING_LENGTH = 9
    MS_ENCRYPTION_KEY_SIZE = 16
    MS_MAX_LABEL_FONTS = 5
    MS_MAX_LABEL_PRIORITY = 10
    MS_MAXCOLORS = 256
    MS_MAXVECTORPOINTS = 100
    MS_STYLE_BINDING_LENGTH = 12

    # Enums
    MS_CONNECTION_TYPE = enum :MS_INLINE,
      :MS_SHAPEFILE,
      :MS_TILED_SHAPEFILE,
      :MS_SDE,
      :MS_OGR,
      :MS_UNUSED_1,
      :MS_POSTGIS,
      :MS_WMS,
      :MS_ORACLESPATIAL,
      :MS_WFS,
      :MS_GRATICULE,
      :MS_MYSQL,
      :MS_RASTER,
      :MS_PLUGIN,
      :MS_UNION,
      :MS_UVRASTER,
      :MS_CONTOUR,
      :MS_KERNELDENSITY

    MS_JOIN_TYPE = enum :MS_JOIN_ONE_TO_ONE,
      :MS_JOIN_ONE_TO_MANY

    MS_LAYER_TYPE = enum :MS_LAYER_POINT,
      :MS_LAYER_LINE,
      :MS_LAYER_POLYGON,
      :MS_LAYER_RASTER,
      :MS_LAYER_ANNOTATION,
      :MS_LAYER_QUERY,
      :MS_LAYER_CIRCLE,
      :MS_LAYER_TILEINDEX,
      :MS_LAYER_CHART

    MS_POSITIONS_ENUM = enum :MS_UL, 101,
      :MS_LR,
      :MS_UR,
      :MS_LL,
      :MS_CR,
      :MS_CL,
      :MS_UC,
      :MS_LC,
      :MS_CC,
      :MS_AUTO,
      :MS_XY,
      :MS_NONE,
      :MS_AUTO2,
      :MS_FOLLOW

    MS_QUERY_MODE = enum :MS_QUERY_SINGLE,
      :MS_QUERY_MULTIPLE

    MS_QUERY_TYPE = enum :MS_QUERY_IS_NULL,
      :MS_QUERY_BY_POINT,
      :MS_QUERY_BY_RECT,
      :MS_QUERY_BY_SHAPE,
      :MS_QUERY_BY_ATTRIBUTE,
      :MS_QUERY_BY_INDEX,
      :MS_QUERY_BY_FILTER

    MS_SHAPE_TYPE = enum :MS_SHAPE_POINT,
      :MS_SHAPE_LINE,
      :MS_SHAPE_POLYGON,
      :MS_SHAPE_NULL

    MS_TRANSFORM_MODE = enum :MS_TRANSFORM_NONE,
      :MS_TRANSFORM_ROUND,
      :MS_TRANSFORM_SNAPTOGRID,
      :MS_TRANSFORM_FULLRESOLUTION,
      :MS_TRANSFORM_SIMPLIFY

    MS_UNITS = enum :MS_INCHES,
      :MS_FEET,
      :MS_MILES,
      :MS_METERS,
      :MS_KILOMETERS,
      :MS_DD,
      :MS_PIXELS,
      :MS_PERCENTAGES,
      :MS_NAUTICALMILES

    SortOrderEnum = enum :SORT_ASC,
      :SORT_DESC

    #--------------
    # Typedefs
    #--------------
    typedef :long, :ms_int32
    typedef :ulong, :ms_uint32
    typedef :int, :ms_int32
    typedef :uint, :ms_uint32
    # typedef :int32_t, :ms_int32
    # typedef :uint32_t, :ms_uint32

    # pointer to a ms_unint32
    typedef :pointer, :ms_bitarray
    # pointer to a const ms_uint32
    typedef :pointer, :ms_const_bitarray

    #--------------
    # Structs
    #--------------
    # From libc
    class TM < FFI::Struct
      layout :tm_sec, :int,
        :tm_min, :int,
        :tm_hour, :int,
        :tm_mday, :int,
        :tm_mon, :int,
        :tm_year, :int,
        :tm_wday, :int,
        :tm_yday, :int,
        :tm_isdst, :int
    end

    class MSRegexT < FFI::Struct
      layout :sys_regex, :pointer
    end

    autoload :AttributeBindingObj,
      File.expand_path('mapserver/attribute_binding_obj', __dir__)

    autoload :BufferObj,
      File.expand_path('mapserver/buffer_obj', __dir__)

    autoload :ClassObj,
      File.expand_path('mapserver/class_obj', __dir__)
    autoload :ClusterObj,
      File.expand_path('mapserver/cluster_obj', __dir__)
    autoload :ColorObj,
      File.expand_path('mapserver/color_obj', __dir__)

    autoload :ExpressionObj,
      File.expand_path('mapserver/expression_obj', __dir__)

    autoload :FeatureListNodeObj,
      File.expand_path('mapserver/feature_list_node_obj', __dir__)
    autoload :FontSetObj,
      File.expand_path('mapserver/font_set_obj', __dir__)

    autoload :GeotransformObj,
      File.expand_path('mapserver/geotransform_obj', __dir__)
    autoload :GraticuleObj,
      File.expand_path('mapserver/graticule_obj', __dir__)

    autoload :HashObj,
      File.expand_path('mapserver/hash_obj', __dir__)
    autoload :HashTableObj,
      File.expand_path('mapserver/hash_table_obj', __dir__)

    autoload :ImageCacheObj,
      File.expand_path('mapserver/image_cache_obj', __dir__)
    autoload :ImageObj,
      File.expand_path('mapserver/image_obj', __dir__)
    autoload :ItemObj,
      File.expand_path('mapserver/item_obj', __dir__)

    autoload :JoinObj,
      File.expand_path('mapserver/join_obj', __dir__)

    autoload :LabelCacheObj,
      File.expand_path('mapserver/label_cache_obj', __dir__)
    autoload :LabelCacheMemberObj,
      File.expand_path('mapserver/label_cache_member_obj', __dir__)
    autoload :LabelCacheSlotObj,
      File.expand_path('mapserver/label_cache_slot_obj', __dir__)
    autoload :LabelLeaderObj,
      File.expand_path('mapserver/label_leader_obj', __dir__)
    autoload :LabelObj,
      File.expand_path('mapserver/label_obj', __dir__)
    autoload :LabelStyleObj,
      File.expand_path('mapserver/label_style_obj', __dir__)
    autoload :LayerObj,
      File.expand_path('mapserver/layer_obj', __dir__)
    autoload :LayerVTableObj,
      File.expand_path('mapserver/layer_v_table_obj', __dir__)
    autoload :LegendObj,
      File.expand_path('mapserver/legend_obj', __dir__)
    autoload :LineObj,
      File.expand_path('mapserver/line_obj', __dir__)

    autoload :MapObj,
      File.expand_path('mapserver/map_obj', __dir__)
    autoload :MarkerCacheMemberObj,
      File.expand_path('mapserver/marker_cache_member_obj', __dir__)

    autoload :OutputFormatObj,
      File.expand_path('mapserver/output_format_obj', __dir__)
    autoload :OriginalScaleTokenStrings,
      File.expand_path('mapserver/original_scale_token_strings', __dir__)

    autoload :PaletteArrayObj,
      File.expand_path('mapserver/palette_array_obj', __dir__)
    autoload :PaletteObj,
      File.expand_path('mapserver/palette_obj', __dir__)
    autoload :PointObj,
      File.expand_path('mapserver/point_obj', __dir__)
    autoload :ProjectionObj,
      File.expand_path('mapserver/projection_obj', __dir__)

    autoload :QueryMapObj,
      File.expand_path('mapserver/query_map_obj', __dir__)
    autoload :QueryObj,
      File.expand_path('mapserver/query_obj', __dir__)

    autoload :RGBAArrayObj,
      File.expand_path('mapserver/rgba_array_obj', __dir__)
    autoload :RGBAPixel,
      File.expand_path('mapserver/rgba_pixel', __dir__)
    autoload :RGBPixel,
      File.expand_path('mapserver/rgb_pixel', __dir__)
    autoload :RasterBufferObj,
      File.expand_path('mapserver/raster_buffer_obj', __dir__)
    autoload :RectObj,
      File.expand_path('mapserver/rect_obj', __dir__)
    autoload :ReferenceMapObj,
      File.expand_path('mapserver/reference_map_obj', __dir__)
    autoload :RendererVTableObj,
      File.expand_path('mapserver/renderer_v_table_obj', __dir__)
    autoload :ResultCacheObj,
      File.expand_path('mapserver/result_cache_obj', __dir__)
    autoload :ResultObj,
      File.expand_path('mapserver/result_obj', __dir__)

    autoload :ScaleTokenEntryObj,
      File.expand_path('mapserver/scale_token_entry_obj', __dir__)
    autoload :ScaleTokenObj,
      File.expand_path('mapserver/scale_token_obj', __dir__)
    autoload :ScalebarObj,
      File.expand_path('mapserver/scalebar_obj', __dir__)
    autoload :ShapeObj,
      File.expand_path('mapserver/shape_obj', __dir__)
    autoload :SortByClause,
      File.expand_path('mapserver/sort_by_properties', __dir__)
    autoload :SortByProperties,
      File.expand_path('mapserver/sort_by_properties', __dir__)
    autoload :StyleObj,
      File.expand_path('mapserver/style_obj', __dir__)
    autoload :SymbolObj,
      File.expand_path('mapserver/symbol_obj', __dir__)
    autoload :SymbolSetObj,
      File.expand_path('mapserver/symbol_set_obj', __dir__)

    autoload :TileCacheObj,
      File.expand_path('mapserver/tile_cache_obj', __dir__)
    autoload :TokenListNodeObj,
      File.expand_path('mapserver/token_list_node_obj', __dir__)
    autoload :TokenValueObj,
      File.expand_path('mapserver/token_value_obj', __dir__)

    autoload :VectorObj,
      File.expand_path('mapserver/vector_obj', __dir__)

    autoload :WebObj,
      File.expand_path('mapserver/web_obj', __dir__)
  end
end
