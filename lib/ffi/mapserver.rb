require 'ffi'
require_relative 'libc/tm'

module FFI
  module Mapserver
    extend FFI::Library

    ffi_lib 'mapserver'

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

    MS_JOIN_CONNECTION_TYPE = enum :MS_DB_XBASE,
      :MS_DB_CSV,
      :MS_DB_MYSQL,
      :MS_DB_ORACLE,
      :MS_DB_POSTGRES

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
      File.expand_path('mapserver/mapsymbol/color_obj', __dir__)

    autoload :ExpressionObj,
      File.expand_path('mapserver/expression_obj', __dir__)

    autoload :FeatureListNodeObj,
      File.expand_path('mapserver/feature_list_node_obj', __dir__)
    autoload :FontSetObj,
      File.expand_path('mapserver/font_set_obj', __dir__)

    autoload :GeotransformObj,
      File.expand_path('mapserver/mapprimitive/geotransform_obj', __dir__)
    autoload :GlyphElement,
      File.expand_path('mapserver/fontcache/glyph_element', __dir__)
    autoload :GlyphElementKey,
      File.expand_path('mapserver/fontcache/glyph_element_key', __dir__)
    autoload :GlyphObj,
      File.expand_path('mapserver/glpyh_obj', __dir__)
    autoload :GraticuleObj,
      File.expand_path('mapserver/graticule_obj', __dir__)

    autoload :HashObj,
      File.expand_path('mapserver/maphash/hash_obj', __dir__)
    autoload :HashTableObj,
      File.expand_path('mapserver/maphash/hash_table_obj', __dir__)

    autoload :ImageCacheObj,
      File.expand_path('mapserver/mapsymbol/image_cache_obj', __dir__)
    autoload :ImageObj,
      File.expand_path('mapserver/image_obj', __dir__)
    autoload :ItemObj,
      File.expand_path('mapserver/mapprimitive/item_obj', __dir__)

    autoload :JoinObj,
      File.expand_path('mapserver/join_obj', __dir__)

    autoload :LabelBounds,
      File.expand_path('mapserver/label_bounds', __dir__)
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
      File.expand_path('mapserver/mapprimitive/line_obj', __dir__)

    autoload :MapObj,
      File.expand_path('mapserver/map_obj', __dir__)
    autoload :MarkerCacheMemberObj,
      File.expand_path('mapserver/marker_cache_member_obj', __dir__)

    autoload :OutputFormatObj,
      File.expand_path('mapserver/output_format_obj', __dir__)
    autoload :OriginalScaleTokenStrings,
      File.expand_path('mapserver/original_scale_token_strings', __dir__)

    autoload :PaletteArrayObj,
      File.expand_path('mapserver/mapsymbol/palette_array_obj', __dir__)
    autoload :PaletteObj,
      File.expand_path('mapserver/palette_obj', __dir__)
    autoload :PointObj,
      File.expand_path('mapserver/mapprimitive/point_obj', __dir__)
    autoload :ProjectionObj,
      File.expand_path('mapserver/projection_obj', __dir__)

    autoload :QueryMapObj,
      File.expand_path('mapserver/query_map_obj', __dir__)
    autoload :QueryObj,
      File.expand_path('mapserver/query_obj', __dir__)

    autoload :RGBAArrayObj,
      File.expand_path('mapserver/mapsymbol/rgba_array_obj', __dir__)
    autoload :RGBAPixel,
      File.expand_path('mapserver/mapsymbol/rgba_pixel', __dir__)
    autoload :RGBPixel,
      File.expand_path('mapserver/mapsymbol/rgb_pixel', __dir__)
    autoload :RasterBufferObj,
      File.expand_path('mapserver/mapsymbol/raster_buffer_obj', __dir__)
    autoload :RectObj,
      File.expand_path('mapserver/mapprimitive/rect_obj', __dir__)
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
      File.expand_path('mapserver/mapprimitive/shape_obj', __dir__)
    autoload :SortByClause,
      File.expand_path('mapserver/sort_by_clause', __dir__)
    autoload :SortByProperties,
      File.expand_path('mapserver/sort_by_properties', __dir__)
    autoload :StyleObj,
      File.expand_path('mapserver/style_obj', __dir__)
    autoload :SymbolObj,
      File.expand_path('mapserver/mapsymbol/symbol_obj', __dir__)
    autoload :SymbolSetObj,
      File.expand_path('mapserver/symbol_set_obj', __dir__)

    autoload :TextPathObj,
      File.expand_path('mapserver/text_path_obj', __dir__)
    autoload :TextSymbolObj,
      File.expand_path('mapserver/text_symbol_obj', __dir__)
    autoload :TileCacheObj,
      File.expand_path('mapserver/tile_cache_obj', __dir__)
    autoload :TokenListNodeObj,
      File.expand_path('mapserver/token_list_node_obj', __dir__)
    autoload :TokenValueObj,
      File.expand_path('mapserver/token_value_obj', __dir__)

    autoload :VectorObj,
      File.expand_path('mapserver/mapprimitive/vector_obj', __dir__)

    autoload :WebObj,
      File.expand_path('mapserver/web_obj', __dir__)

    #-------
    # Functions
    #-------
    attach_function :msSaveImage, [:pointer, :pointer, :string], :int
    attach_function :msFreeImage, [:pointer], :void
    attach_function :msSetup, [], :int
    attach_function :msCleanup, [:int], :void
    attach_function :msLoadMapFromString, [:string, :string], MapObj.ptr

    attach_function :initJoin, [JoinObj.ptr], :void
    attach_function :initSymbol, [SymbolObj.ptr], :void
    attach_function :initMap, [MapObj.ptr], :int
    #attach_function :msGrowMaplayers, [:pointer], LayerObj
    attach_function :initLayer, [LayerObj.ptr, MapObj.ptr], :int
    attach_function :freeLayer, [LayerObj.ptr], :int
    #attach_function :msGrowLayerScaletokens, [:pointer], :pointer
    #attach_function :initScaleToken, [:pointer], :int
    attach_function :initClass, [ClassObj.ptr], :int
    attach_function :freeClass, [ClassObj.ptr], :int
    attach_function :msGrowClassStyles, [ClassObj.ptr], StyleObj.ptr
    attach_function :msGrowClassLabels, [ClassObj.ptr], LabelObj.ptr
    attach_function :msGrowLabelStyles, [LabelObj.ptr], StyleObj.ptr
    attach_function :msGrowLeaderStyles, [LabelLeaderObj.ptr], StyleObj.ptr
    attach_function :msMaybeAllocateClassStyle, [ClassObj.ptr, :int], :int
    attach_function :initLabel, [LabelObj.ptr], :void
    attach_function :freeLabel, [LabelObj.ptr], :int
    #attach_function :freeLabelLeader, [LabelObj.ptr], :int
    attach_function :resetClassStyle, [ClassObj.ptr], :void
    attach_function :initStyle, [StyleObj.ptr], :int
    attach_function :freeStyle, [StyleObj.ptr], :int
    attach_function :initReferenceMap, [ReferenceMapObj.ptr], :void
    attach_function :initScalebar, [ScalebarObj.ptr], :void
    attach_function :initGrid, [GraticuleObj.ptr], :void
    attach_function :initWeb, [WebObj.ptr], :void
    attach_function :initResultCache, [ResultCacheObj.ptr], :void

    attach_function :insertFeatureList,
      [FeatureListNodeObj.ptr, ShapeObj.ptr],
      FeatureListNodeObj.ptr

    attach_function :freeFeatureList, [FeatureListNodeObj.ptr], :void

    attach_function :loadExpressionString, [ExpressionObj.ptr, :string], :int
    attach_function :msLoadExpressionString, [ExpressionObj.ptr, :string], :int
    attach_function :msGetExpressionString, [ExpressionObj.ptr], :string
    #attach_function :msInitExpression, [ExpressionObj.ptr], :void
    #attach_function :msFreeExpressionTokens, [ExpressionObj.ptr], :void
    #attach_function :msFreeExpression, [ExpressionObj.ptr], :void

    attach_function :msApplySubstitutions,
      [MapObj.ptr, :pointer, :pointer, :int],
      :void
    attach_function :msApplyDefaultSubstitutions, [MapObj.ptr], :void

    #attach_function :getClassIndex, [LayerObj.ptr, :string], :int

    # for mapLabel
    attach_function :intersectLabelPolygons,
      [LineObj.ptr, RectObj.ptr, LineObj.ptr, RectObj.ptr],
      :int
    attach_function :intersectTextSymbol,
      [TextSymbolObj.ptr, :pointer],
     :int

    attach_function :get_metrics,
      [PointObj.ptr, :int, TextPathObj.ptr, :int, :int, :double, :int, :pointer], :int

  end
end
