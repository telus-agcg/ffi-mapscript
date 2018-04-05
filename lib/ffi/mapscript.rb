require 'ffi'
require_relative 'libc/tm'

module FFI
  module Mapscript
    extend FFI::Library

    ffi_lib 'mapserver'

    MS_LABEL_BINDING_LENGTH = 9
    MS_ENCRYPTION_KEY_SIZE = 16
    MS_MAX_LABEL_FONTS = 5
    MS_MAX_LABEL_PRIORITY = 10
    MS_MAXCOLORS = 256
    MS_MAXVECTORPOINTS = 100
    MS_STYLE_BINDING_LENGTH = 12
    MS_TRUE = 1
    MS_FALSE = 0

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

    MS_REQUEST_TYPE = enum :MS_GET_REQUEST,
      :MS_POST_REQUEST

    MS_RETURN_VALUE = enum :MS_SUCCESS,
      :MS_FAILURE,
      :MS_DONE

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

    # Used for getBytes. Defined in mapscript/mapscript.i.
    class GDBuffer < FFI::Struct
      layout :data, :pointer,
        :size, :pointer,
        :owns_data, :bool
    end

    # cgiutil
    autoload :CGIRequestObj,
      File.expand_path('mapscript/cgiutil/cgi_request_obj', __dir__)

    # fontcache
    autoload :FaceElement,
      File.expand_path('mapscript/fontcache/face_element', __dir__)
    autoload :GlyphElement,
      File.expand_path('mapscript/fontcache/glyph_element', __dir__)
    autoload :GlyphElementKey,
      File.expand_path('mapscript/fontcache/glyph_element_key', __dir__)

    # maphash
    autoload :HashObj,
      File.expand_path('mapscript/maphash/hash_obj', __dir__)
    autoload :HashTableObj,
      File.expand_path('mapscript/maphash/hash_table_obj', __dir__)

    # mapows
    autoload :OWSRequestObj,
      File.expand_path('mapscript/mapows/ows_request_obj', __dir__)
    autoload :SOSParamsObj,
      File.expand_path('mapscript/mapows/sos_params_obj', __dir__)
    autoload :WFSParamsObj,
      File.expand_path('mapscript/mapows/wfs_params_obj', __dir__)
    autoload :WMSParamsObj,
      File.expand_path('mapscript/mapows/wms_params_obj', __dir__)

    # mapprimitive
    autoload :GeotransformObj,
      File.expand_path('mapscript/mapprimitive/geotransform_obj', __dir__)
    autoload :ItemObj,
      File.expand_path('mapscript/mapprimitive/item_obj', __dir__)
    autoload :LineObj,
      File.expand_path('mapscript/mapprimitive/line_obj', __dir__)
    autoload :PointObj,
      File.expand_path('mapscript/mapprimitive/point_obj', __dir__)
    autoload :RectObj,
      File.expand_path('mapscript/mapprimitive/rect_obj', __dir__)
    autoload :ShapeObj,
      File.expand_path('mapscript/mapprimitive/shape_obj', __dir__)
    autoload :VectorObj,
      File.expand_path('mapscript/mapprimitive/vector_obj', __dir__)

    # mapsymbol
    autoload :ColorObj,
      File.expand_path('mapscript/mapsymbol/color_obj', __dir__)
    autoload :ImageCacheObj,
      File.expand_path('mapscript/mapsymbol/image_cache_obj', __dir__)
    autoload :PaletteArrayObj,
      File.expand_path('mapscript/mapsymbol/palette_array_obj', __dir__)
    autoload :RGBAArrayObj,
      File.expand_path('mapscript/mapsymbol/rgba_array_obj', __dir__)
    autoload :RGBAPixel,
      File.expand_path('mapscript/mapsymbol/rgba_pixel', __dir__)
    autoload :RGBPixel,
      File.expand_path('mapscript/mapsymbol/rgb_pixel', __dir__)
    autoload :RasterBufferObj,
      File.expand_path('mapscript/mapsymbol/raster_buffer_obj', __dir__)
    autoload :SymbolObj,
      File.expand_path('mapscript/mapsymbol/symbol_obj', __dir__)

    # msio.h
    autoload :MSIOBuffer,
      File.expand_path('mapscript/msio/ms_io_buffer', __dir__)
    autoload :MSIOContext,
      File.expand_path('mapscript/msio/ms_io_context', __dir__)

    # mapserver.h
    autoload :AttributeBindingObj,
      File.expand_path('mapscript/attribute_binding_obj', __dir__)

    autoload :BufferObj,
      File.expand_path('mapscript/buffer_obj', __dir__)

    autoload :ClassObj,
      File.expand_path('mapscript/class_obj', __dir__)
    autoload :ClusterObj,
      File.expand_path('mapscript/cluster_obj', __dir__)

    autoload :ExpressionObj,
      File.expand_path('mapscript/expression_obj', __dir__)

    autoload :FeatureListNodeObj,
      File.expand_path('mapscript/feature_list_node_obj', __dir__)
    autoload :FontSetObj,
      File.expand_path('mapscript/font_set_obj', __dir__)

    autoload :GlyphObj,
      File.expand_path('mapscript/glyph_obj', __dir__)
    autoload :GlyphMetrics,
      File.expand_path('mapscript/glyph_metrics', __dir__)
    autoload :GraticuleObj,
      File.expand_path('mapscript/graticule_obj', __dir__)

    autoload :ImageObj,
      File.expand_path('mapscript/image_obj', __dir__)

    autoload :JoinObj,
      File.expand_path('mapscript/join_obj', __dir__)

    autoload :LabelBounds,
      File.expand_path('mapscript/label_bounds', __dir__)
    autoload :LabelCacheObj,
      File.expand_path('mapscript/label_cache_obj', __dir__)
    autoload :LabelCacheMemberObj,
      File.expand_path('mapscript/label_cache_member_obj', __dir__)
    autoload :LabelCacheSlotObj,
      File.expand_path('mapscript/label_cache_slot_obj', __dir__)
    autoload :LabelLeaderObj,
      File.expand_path('mapscript/label_leader_obj', __dir__)
    autoload :LabelObj,
      File.expand_path('mapscript/label_obj', __dir__)
    autoload :LabelStyleObj,
      File.expand_path('mapscript/label_style_obj', __dir__)
    autoload :LayerObj,
      File.expand_path('mapscript/layer_obj', __dir__)
    autoload :LayerVTableObj,
      File.expand_path('mapscript/layer_v_table_obj', __dir__)
    autoload :LegendObj,
      File.expand_path('mapscript/legend_obj', __dir__)

    autoload :MapObj,
      File.expand_path('mapscript/map_obj', __dir__)
    autoload :MarkerCacheMemberObj,
      File.expand_path('mapscript/marker_cache_member_obj', __dir__)

    autoload :OutputFormatObj,
      File.expand_path('mapscript/output_format_obj', __dir__)
    autoload :OriginalScaleTokenStrings,
      File.expand_path('mapscript/original_scale_token_strings', __dir__)

    autoload :PaletteObj,
      File.expand_path('mapscript/palette_obj', __dir__)
    autoload :ProjectionObj,
      File.expand_path('mapscript/projection_obj', __dir__)

    autoload :QueryMapObj,
      File.expand_path('mapscript/query_map_obj', __dir__)
    autoload :QueryObj,
      File.expand_path('mapscript/query_obj', __dir__)

    autoload :ReferenceMapObj,
      File.expand_path('mapscript/reference_map_obj', __dir__)
    autoload :RendererVTableObj,
      File.expand_path('mapscript/renderer_v_table_obj', __dir__)
    autoload :ResultCacheObj,
      File.expand_path('mapscript/result_cache_obj', __dir__)
    autoload :ResultObj,
      File.expand_path('mapscript/result_obj', __dir__)

    autoload :ScaleTokenEntryObj,
      File.expand_path('mapscript/scale_token_entry_obj', __dir__)
    autoload :ScaleTokenObj,
      File.expand_path('mapscript/scale_token_obj', __dir__)
    autoload :ScalebarObj,
      File.expand_path('mapscript/scalebar_obj', __dir__)
    autoload :SortByClause,
      File.expand_path('mapscript/sort_by_clause', __dir__)
    autoload :SortByProperties,
      File.expand_path('mapscript/sort_by_properties', __dir__)
    autoload :StyleObj,
      File.expand_path('mapscript/style_obj', __dir__)
    autoload :SymbolSetObj,
      File.expand_path('mapscript/symbol_set_obj', __dir__)

    autoload :TextPathObj,
      File.expand_path('mapscript/text_path_obj', __dir__)
    autoload :TextSymbolObj,
      File.expand_path('mapscript/text_symbol_obj', __dir__)
    autoload :TileCacheObj,
      File.expand_path('mapscript/tile_cache_obj', __dir__)
    autoload :TokenListNodeObj,
      File.expand_path('mapscript/token_list_node_obj', __dir__)
    autoload :TokenValueObj,
      File.expand_path('mapscript/token_value_obj', __dir__)

    autoload :WebObj,
      File.expand_path('mapscript/web_obj', __dir__)

    #-------
    # Functions
    #-------
    attach_function :msSaveImage, [:pointer, :pointer, :string], :int
    attach_function :msSaveImageBuffer, [ImageObj.ptr, :pointer, OutputFormatObj.ptr], :pointer
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
      # [FeatureListNodeObj.ptr, ShapeObj.ptr],
      %i[pointer pointer],
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
    #attach_function :intersectTextSymbol,
    #  [TextSymbolObj.ptr, :pointer],
    # :int

    attach_function :get_metrics,
      [PointObj.ptr, :int, TextPathObj.ptr, :int, :int, :double, :int, :pointer],
      :int

    #attach_function :dist, [PointObj.ptr, PointObj.ptr], :double
    attach_function :fastComputeBounds, [LineObj.ptr, RectObj.ptr], :void

    #---------------------------------------------------------------------------
    # Main API functions
    #---------------------------------------------------------------------------
    attach_function :msLayerGetExtent, [LayerObj.ptr, RectObj.ptr], :int

    #~~~~~
    # mapobject.c
    #~~~~~
    attach_function :msFreeMap, [MapObj.ptr], :void
    attach_function :msNewMapObj, [], MapObj.ptr
    attach_function :msGetConfigOption, [MapObj.ptr, :string], :string
    attach_function :msSetConfigOption, [MapObj.ptr, :string, :string], :int
    attach_function :msTestConfigOption,
      [MapObj.ptr, :string, :int],
      :int
    attach_function :msApplyMapConfigOptions, [MapObj.ptr], :void
    attach_function :msMapComputeGeotransform, [MapObj.ptr], :int
    attach_function :msMapPixelToGeoref, [MapObj.ptr, :pointer, :pointer], :void
    attach_function :msMapGeorefToPixel, [MapObj.ptr, :pointer, :pointer], :void
    attach_function :msMapSetExtent,
      [MapObj.ptr, :double, :double, :double, :double],
      :int

    attach_function :msMapOffsetExtent, [MapObj.ptr, :double, :double], :int

    attach_function :msMapScaleExtent,
      [MapObj.ptr, :double, :double, :double],
      :int

    attach_function :msMapSetCenter, [MapObj.ptr, PointObj.ptr], :int
    attach_function :msMapSetRotation, [MapObj.ptr, :double], :int
    attach_function :msMapSetSize, [MapObj.ptr, :int, :int], :int
    attach_function :msMapSetFakedExtent, [MapObj.ptr], :int
    attach_function :msMapRestoreRealExtent, [MapObj.ptr], :int
    attach_function :msMapLoadOWSParameters,
      [MapObj.ptr, CGIRequestObj.ptr, :string],
      :int
    attach_function :msMapIgnoreMissingData, [MapObj.ptr], :int

    #~~~~~
    # mapfile.c
    #~~~~~
    attach_function :msValidateParameter,
      [:string, :string, :string, :string, :string],
      :int
    attach_function :msGetLayerIndex, [MapObj.ptr, :string], :int
    attach_function :msGetSymbolIndex, [SymbolSetObj.ptr, :string, :int], :int
    attach_function :msLoadMap, [:string, :string], MapObj.ptr
    #attach_function :msTransformXmlMapfile, [:string, :string, :string], :int
    attach_function :msSaveMap, [MapObj.ptr, :string], :int
    attach_function :msFreeCharArray, [:pointer, :int], :void

    #----
    # shape things
    #----
    attach_function :msShapeFromWKT, [:string], ShapeObj.ptr
    attach_function :msGEOSShapeFromWKT, [:string], ShapeObj.ptr
    attach_function :msOGRShapeFromWKT, [:string], ShapeObj.ptr

    #~~~~
    # maperror.h
    #~~~~
    MS_MISCERR = 12

    attach_function :msSetError, %i[int string string], :void

    #~~~~
    # mapdraw prototypes
    #~~~~
    attach_function :msDrawMap, [MapObj.ptr, :bool], ImageObj
  end
end

require_relative 'mapscript/cgiutil'
require_relative 'mapscript/mapio'
require_relative 'mapscript/mapows'
