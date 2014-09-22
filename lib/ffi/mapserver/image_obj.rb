require 'ffi'

module FFI
  module Mapserver
    extend FFI::Library

    class ImageObjectImg < FFI::Union
      layout :plugin, :pointer,
      :image_map, :string,
      :raw_16bit, :pointer,   # short
      :raw_float, :pointer,   # float
      :raw_byte, :pointer     # uchar
    end

    class ImageObj < FFI::Struct
      layout :width, :int,
        :height, :int,
        :resolution, :double,
        :resolution_factor, :double,
        :image_path, :string,
        :image_url, :string,
        :format, OutputFormatObj.ptr,
        :tile_cache, TileCacheObj.ptr,
        :ntiles, :int,
        :size, :int,
        :img, ImageObjectImg,
        :img_mask, :ms_bitarray,
        :ref_pt, PointObj,
        :map, MapObj.ptr
    end
  end
end
