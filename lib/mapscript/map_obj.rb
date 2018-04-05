require 'forwardable'
require_relative 'layer_obj'
require_relative 'image_obj'

module Mapscript
  class MapObj
    extend Forwardable

    def self.delegate_to_c_struct(method)
      attribute = method.to_s.sub(/=/, '').to_sym

      define_method("#{method}=") do |new_value|
        self.instance_variable_get(:@c_pointer)[attribute] = new_value
      end

      define_method(method) do
        self.instance_variable_get(:@c_pointer)[attribute]
      end
    end

    %i[
      height
      width
      max_size
      max_layers
      transparent
      interlace
      image_quality
      cell_size
      units
      scale_denom
      resolution
      default_resolution
      shape_path
      map_path
      num_output_formats
      image_type
      data_pattern
      template_pattern
      encryption_key_loaded
    ].each { |meth_name| delegate_to_c_struct(meth_name) }

    def initialize(path = nil)
      @c_pointer = if path
                     FFI::Mapscript.msLoadMap(path, nil)
                   else
                     FFI::Mapscript.msNewMapObj
                   end
    end

    # @param name [String] Name of the layer to get.
    # @return [FFI::Mapscript::LayerObj]
    # TODO: Return a Mapscript::LayerObj instead of the struct.
    def layer_by_name(name)
      index = FFI::Mapscript.msGetLayerIndex(@c_pointer, name)
      layer_obj_ptr = @c_pointer[:layers][index]
      return if layer_obj_ptr.null?

      Mapscript::LayerObj.new(layer_obj_ptr)
    end
    alias_method :getLayerByName, :layer_by_name

    # @param ows_mode [Boolean]
    # @return [FFI::Mapscript::MS_RETURN_VALUE]
    def ows_dispatch(cgi_request_obj, ows_mode = true)
      request_obj = if cgi_request_obj.is_a? Mapscript::CGIRequest
                      cgi_request_obj.c_pointer
                    elsif cgi_request_obj.is_a? FFI::Mapscript::CGIRequestObj
                      cgi_request_obj
                    end

      mode = ows_mode ? 1 : 0
      return_value = FFI::Mapscript.msOWSDispatch(@c_pointer, request_obj, mode)

      case FFI::Mapscript::MS_RETURN_VALUE[return_value]
      when :MS_DONE then nil
      when :MS_SUCCESS then true
      when :MS_FAILURE then raise 'OWS request failed to process.'
      end
    end
    alias_method :OWSDispatch, :ows_dispatch

    # @param new_center [FFI::Mapscript::PointObj]
    # TODO: allow passsing in a ruby object.
    def center=(new_center)
      FFI::Mapscript.msMapSetCenter(@c_pointer, new_center)
    end

    def size=(width, height)
      FFI::Mapscript.msMapSetSize(@c_pointer, width, height)
    end

    # @param rotation_angle [Float]
    def rotation=(rotation_angle)
      FFI::Mapscript.msMapSetRotation(@c_pointer, rotation_angle)
    end

    # @param index [Fixnum]
    def layer(index)
      return if index < 0

      if index > @c_pointer[:num_layers]
        raise "Requested layer index must be less than #{@c_pointer[:num_layers]}"
      end

      @c_pointer[:layers][index]
    end
    alias_method :getLayer, :layer

    def symbol_by_name(name)
      FFI::Mapscript.msGetSymbolIndex(@c_pointer[:symbol_set], name,
                                      FFI::Mapscript::MS_TRUE)
    end
    alias_method :getSymbolByName, :symbol_by_name

    # def prepare_query
    #   FFI::Mapscript.msCalculateScale(extent, units, width, height,
    #     resolution, @c_pointer[:scale_denom])
    # end

    def prepare_image
      FFI::Mapscript.msPrepareImage(@c_pointer, FFI::Mapscript::MS_FALSE)
    end
    alias_method :prepareImage, :prepare_image

    # def image_type=(type)
    # end

    # def select_output_format(type)
    # end

    def output_format(index)
      return nil if index < 0

      if index > num_output_formats
        raise "Requested output format index must be less than #{@c_pointer[:num_layers]}"
      end

      @c_pointer[:output_format_list][index]
    end
    alias_method :outputformat, :output_format

    # def output_format=(format)
    # end

    # @return [Mapscript::ImageObj]
    def draw
      image_obj_struct = FFI::Mapscript.msDrawMap(@c_pointer, false)

      Mapscript::ImageObj.new(image_obj_struct)
    end

    # @return [FFI:Mapscript::ImageObj]
    def draw_query
      FFI::Mapscript.msDrawMap(@c_pointer, true)
    end
    alias_method :drawQuery, :draw_query

    # @return [FFI:Mapscript::ImageObj]
    def draw_legend
      FFI::Mapscript.msDrawLegend(@c_pointer, FFI::Mapscript::MS_FALSE, nil)
    end
    alias_method :drawLegend, :draw_legend

    # @return [FFI:Mapscript::ImageObj]
    def draw_scalebar
      FFI::Mapscript.msDrawScalebar(@c_pointer)
    end
    alias_method :drawScalebar, :draw_scalebar

    # @return [FFI:Mapscript::ImageObj]
    def draw_reference_map
      FFI::Mapscript.msDrawReferenceMap(@c_pointer)
    end
    alias_method :drawReferenceMap, :draw_reference_map

    # @param image [FFI::Mapscript::ImageObj]
    # @return [Fixnum]
    def embed_scalebar(image)
      FFI::Mapscript.msEmbedScalebar(@c_pointer, image)
    end
    alias_method :embedScalebar, :embed_scalebar

    # @param image [FFI::Mapscript::ImageObj]
    # @return [Fixnum]
    def embed_legend(image)
      FFI::Mapscript.msEmbedLegend(@c_pointer, image)
    end
    alias_method :embedLegend, :embed_legend

    # @param image [FFI::Mapscript::ImageObj]
    # @return [Fixnum]
    def draw_label_cache(image)
      FFI::Mapscript.msDrawLabelCache(@c_pointer, image)
    end
    alias_method :drawLabelCache, :draw_label_cache

    # @return [Fixnum]
    # def query_by_filter(filter)
    # end

    # @param point [FFI::Mapscript::PointObj]
    # @param mode [Fixnum]
    # @param buffer [Float]
    # @return [Fixnum]
    # def query_by_point(point, mode, buffer)
    # end

    # @param point [FFI::Mapscript::RectObj]
    # @return [Fixnum]
    # def query_by_rect(rect)
    # end

    # @param s_layer [Fixnum]
    # @return [Fixnum]
    def query_by_features(s_layer)
      @c_pointer[:s_layer] = s_layer
      FFI::Mapscript.msQueryByFeatures(@c_pointer)
    end
    alias_method :queryByFeatures, :query_by_features

    # @param shape [FFI::MemoryPointer] to a FFI::Mapscript::ShapeObj.
    # @return [Fixnum]
    # def query_by_shape(shape)
    # end

    # @param wkt [String]
    # def wkt_projection=(wkt)
    # end

    # @return [String]
    def projection
      FFI::Mapscript.msGetProjectionString(@c_pointer[:projection])
    end
    alias_method :getProjection, :projection

    # @param new_projection [String] A Proj4 projection.
    # @return [Fixnum]
    # def projection=(new_projection)
    # end
    # alias_method :setProjection, :projection=

    # @param file_name [String]
    # @return [Fixnum]
    def save(file_name)
      FFI::Mapscript.msSaveMap(@c_pointer, file_name)
    end

    # @param file_name [String]
    # @return [Fixnum]
    def save_query(file_name, results = FFI::Mapscript::MS_FALSE)
      FFI::Mapscript.msSaveQuery(@c_pointer, file_name, results)
    end
    alias_method :saveQuery, :save_query

    # @param file_name [String]
    def load_query(file_name)
      FFI::Mapscript.msLoadQuery(@c_pointer, file_name)
    end
    alias_method :loadQuery, :load_query

    def free_query(layer = -1)
      FFI::Mapscript.msQueryFree(@c_pointer, layer)
    end
    alias_method :freeQuery, :free_query

    # @param file_name [String]
    # @param namespace [String]
    #def save_query_as_gml(file_name, namespace)
    #end

    # @param name [String]
    # @return [String]
    #def metadata(name)
    #end

    # @param name [String]
    # @param value [String]
    #def metadata=(name, value)
    #end

    # @param name [String]
    # @return [Fixnum]
    #def remove_metadata(name)
    #end

    # @return [String]
    #def first_metadata_key
    #  FFI::Mapscript.msFirstKeyFromHashTable(@c_pointer.web.metadata)
    #end

    # @param point_array [Array<Float, Float, Float, Float>] minx, miny, maxx,
    #   maxy.
    # @return [FFI::Mapscript::MS_RETURN_VALUE]
    # def extent=(*point_array)
    def extent=(min_x, min_y, max_x, max_y)
      result = FFI::Mapscript.msMapSetExtent(@c_pointer, min_x, min_y, max_x, max_y)

      FFI::Mapscript::MS_RETURN_VALUE[result]
    end
    alias_method :setExtent, :extent=

    # @param zoom_factor [Float]
    # @param min_scale_denom [Float]
    # @param max_scale_denom [Float]
    # @return [Boolean]
    def scale_extent(zoom_factor, min_scale_denom, max_scale_denom)
      FFI::Mapscript.msMapScaleExtent(@c_pointer, zoom_factor, min_scale_denom, max_scale_denom)
    end
    alias_method :scaleExtent, :scale_extent
  end
end
