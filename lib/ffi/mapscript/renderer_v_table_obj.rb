require 'ffi'

module FFI
  module Mapscript
    extend FFI::Library
    class RendererVTableObj < FFI::Struct
      layout :supports_transparent_layers, :int,
        :supports_pixel_buffer, :int,
        :supports_clipping, :int,
        :supports_svg, :int,
        :use_imagecache, :int,
        :default_transform_mode, MS_TRANSFORM_MODE,
        :transform_mode, MS_TRANSFORM_MODE,
        :default_approximation_scale, :double,
        :approximation_scale, :double,
        :renderer_data, :pointer,
        :render_line, :pointer,     # unused?
        :render_polygon, :pointer,     # unused?
        :render_polygon_tiled, :pointer,     # unused?
        :render_line_tiled, :pointer,     # unused?
        :render_glyphs, :pointer,     # unused?
        :render_text, :pointer,     # unused?
        :render_vector_symbol, :pointer,     # unused?
        :render_pixmap_symbol, :pointer,     # unused?
        :render_ellipse_symbol, :pointer,     # unused?
        :render_svg_symbol, :pointer,     # unused?
        :render_tile, :pointer,     # unused?
        :load_image_from_file, :pointer,     # unused?
        :get_raster_buffer_handle, :pointer,     # unused?
        :get_raster_buffer_copy, :pointer,     # unused?
        :initialize_raster_buffer, :pointer,     # unused?
        :merge_raster_buffer, :pointer,     # unused?
        :create_image, :pointer,     # unused?
        :save_image, :pointer,     # unused?
        :save_image_buffer, :pointer,     # unused?
        :start_layer, :pointer,
        :end_layer, :pointer,
        :start_shape, :pointer,
        :end_shape, :pointer,
        :set_clip, :pointer,
        :reset_clip, :pointer,
        :free_image, :pointer,
        :free_symbol, :pointer,
        :clean_up, :pointer
    end
  end
end
