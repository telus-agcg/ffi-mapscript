require 'ffi'

module FFI
  module Mapscript
    extend FFI::Library

    class OutputFormatObj < FFI::Struct
      layout :ref_count, :int,
        :format_options, :pointer,    # array of strings,
        :num_format_options, :int,
        :name, :string,
        :mime_type, :string,
        :driver, :string,
        :extension, :string,
        :renderer, :int,
        :image_mode, :int,
        :transparent, :int,
        :bands, :int,
        :in_map_file, :int,
        :vtable, RendererVTableObj.ptr,
        :device, :pointer
    end
  end
end
