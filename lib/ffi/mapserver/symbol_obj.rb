require 'ffi'

module FFI
  module Mapserver
    extend FFI::Library

    class SymbolObj < FFI::Struct
      layout :name, :string,
        :type, :int,
        :in_map_file, :int,
        :map, MapObj.ptr,
        :size_x, :double,
        :size_y, :double,
        :min_x, :double,
        :min_y, :double,
        :max_x, :double,
        :max_y, :double,
        :points, [PointObj, MS_MAXVECTORPOINTS],
        :ref_count, :int,
        :num_points, :int,
        :filled, :int,
        :anchor_point_x, :double,
        :anchor_point_y, :double,
        :renderer, RendererVTableObj.ptr,
        :renderer_free_func, :pointer,
        :pixmap_buffer, RasterBufferObj.ptr,
        :renderer_cache, :pointer,
        :full_pixmap_path, :string,
        :image_path, :string,
        :transparent, :int,
        :transparent_color, :int,
        :character, :string,
        :font, :string
    end
  end
end
