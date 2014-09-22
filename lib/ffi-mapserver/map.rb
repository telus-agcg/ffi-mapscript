require 'forwardable'
require_relative '../ffi-mapserver'

module Mapserver
  class Map
    extend Forwardable

    def_delegators :@map_obj_ptr, :height, :width, :max_size, :ref_count,
      :max_layers, :transparent, :interlace, :image_quality, :cell_size,
      :units, :scale_denom, :resolution, :default_resolution, :shape_path,
      :map_path, :num_output_formats, :output_format, :image_type,
      :data_pattern, :template_pattern, :encryption_key_loaded

    def initialize(path = nil)
      @map_obj_ptr = if path
        FFI::Mapserver.msLoadMap(path, nil)
      else
        FFI::Mapserver.msNewMapObj
      end
    end

    def c_poitner
      @map_obj_ptr
    end

    # @param ows_mode [Boolean]
    # @return [FFI::Mapserver::MS_RETURN_VALUE]
    def ows_dispatch(cgi_request_obj, ows_mode = true)
      request_obj = if cgi_request_obj.is_a? Mapserver::CGIRequest
        cgi_request_obj.c_pointer
      elsif cgi_request_obj.is_a? FFI::Mapserver::CGIRequestObj
        cgi_request_obj
      end

      mode = ows_mode ? 1 : 0
      return_value = FFI::Mapserver.msOWSDispatch(@map_obj_ptr, cgi_request_obj, mode)
      case FFI::Mapserver::MS_RETURN_VALUE[return_value]
      when :MS_DONE
        nil
      when :MS_SUCCESS
        true
      when :MS_FAILURE
        raise 'OWS request failed to process.'
      end
    end

    # @param new_center [FFI::Mapserver::PointObj]
    # TODO: allow passsing in a ruby object.
    def center=(new_center)
      FFI::Mapserver.msMapSetCenter(c_pointer, new_center)
    end

    def size=(width, height)
      FFI::Mapserver.msMapSetSize(c_pointer, width, height)
    end

    # @param rotation_angle [Float]
    def rotation=(rotation_angle)
      FFI::Mapserver.msMapSetRotation(c_pointer, rotation_angle)
    end

    # @param index [Fixnum]
    def layer(index)
      return nil if index < 0

      if index > c_pointer.num_layers
        raise "Requested layer index must be less than #{c_pointer.num_layers}"
      end

      c_pointer.layers[index]
    end

    # def layer_by_name(name)
    #   index = FFI::Mapserver.msGetLayerindex(c_poitner, name)
    #   return nil if index == -1
    # end

    def symbol_by_name(name)
      FFI::Mapserver.msGetSymbolIndex(c_pointer.symbol_set, name,
        FFI::Mapserver::MS_TRUE)
    end

    # def prepare_query
    #   FFI::Mapserver.msCalculateScale(extent, units, width, height,
    #     resolution, c_pointer.scale_denom)
    # end
    def prepare_image
      FFI::Mapserver.msPrepareImage(c_pointer, FFI::Mapserver::MS_FALSE)
    end

    # def image_type=(type)
    # end

    # def select_output_format(type)
    # end

    def output_format(index)
      return nil if index < 0

      if index > c_pointer.num_output_formats
        raise "Requested output format index must be less than #{c_pointer.num_layers}"
      end

      c_pointer.output_format_list[index]
    end

    # def output_format=(format)
    # end

    # @return [FFI:Mapserver::ImageObj]
    def draw
      FFI::Mapserver.msDrawMap(c_pointer, FFI::Mapserver::MS_FALSE)
    end

    # @return [FFI:Mapserver::ImageObj]
    def draw_query
      FFI::Mapserver.msDrawMap(c_pointer, FFI::Mapserver::MS_TRUE)
    end

    # @return [FFI:Mapserver::ImageObj]
    def draw_legend
      FFI::Mapserver.msDrawLegend(c_pointer, FFI::Mapserver::MS_FALSE, nil)
    end

    # @return [FFI:Mapserver::ImageObj]
    def draw_scalebar
      FFI::Mapserver.msDrawScalebar(c_pointer)
    end

    # @return [FFI:Mapserver::ImageObj]
    def draw_reference_map
      FFI::Mapserver.msDrawReferenceMap(c_pointer)
    end

    # @param image [FFI::Mapserver::ImageObj]
    # @return [Fixnum]
    def embed_scalebar(image)
      FFI::Mapserver.msEmbedScalebar(c_pointer, image)
    end

    # @param image [FFI::Mapserver::ImageObj]
    # @return [Fixnum]
    def embed_legend(image)
      FFI::Mapserver.msEmbedLegend(c_pointer, image)
    end

    # @param image [FFI::Mapserver::ImageObj]
    # @return [Fixnum]
    def draw_label_cache(image)
      FFI::Mapserver.msDrawLabelCache(c_pointer, image)
    end

    # @return [Fixnum]
    # def query_by_filter(filter)
    # end

    # @param point [FFI::Mapserver::PointObj]
    # @param mode [Fixnum]
    # @param buffer [Float]
    # @return [Fixnum]
    # def query_by_point(point, mode, buffer)
    # end

    # @param point [FFI::Mapserver::RectObj]
    # @return [Fixnum]
    # def query_by_rect(rect)
    # end

    # @param s_layer [Fixnum]
    # @return [Fixnum]
    def query_by_features(s_layer)
      c_pointer.s_layer = s_layer
      FFI::Mapserver.msQueryByFeatures(c_pointer)
    end

    # @param shape [FFI::MemoryPointer] to a FFI::Mapserver::ShapeObj.
    # @return [Fixnum]
    # def query_by_shape(shape)
    # end

    # @param wkt [String]
    # def wkt_projection=(wkt)
    # end

    # @return [String]
    # def projection
    #   FFI::Mapserver.msGetProjectionString(c_pointer.projection)
    # end

    # @param new_projection [String] A Proj4 projection.
    # @return [Fixnum]
    def projection=(new_projection)
    end

    # @param file_name [String]
    # @return [Fixnum]
    def save(file_name)
      FFI::Mapserver.msSaveMap(c_pointer, file_name)
    end

    # @param file_name [String]
    # @return [Fixnum]
    def save_query(file_name, results = FFI::Mapserver::MS_FALSE)
      FFI::Mapserver.msSaveQuery(c_pointer, file_name, results)
    end

    # @param file_name [String]
    def load_query(file_name)
      FFI::Mapserver.msLoadQuery(c_pointer, file_name)
    end

    def free_query(layer = -1)
      FFI::Mapserver.msQueryFree(c_pointer, layer)
    end

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
    #  FFI::Mapserver.msFirstKeyFromHashTable(c_pointer.web.metadata)
    #end
  end
end
