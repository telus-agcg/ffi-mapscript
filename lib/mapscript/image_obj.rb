module Mapscript
  class ImageObj
    def initialize(c_pointer_or_struct)
      @c_struct = case c_pointer_or_struct
                    when FFI::Mapscript::ImageObj then c_pointer_or_struct
                    when FFI::Pointer             then FFI::Mapscript::ImageObj.new(c_pointer_or_struct)
                    end

      @c_struct[:format] = FFI::Mapscript::OutputFormatObj.new if @c_struct[:format].null?
    end

    def bytes
      gd_buffer = build_populated_gd_buffer
      data_size = gd_buffer[:size].null? ? 0 : gd_buffer[:size].read_int

      if gd_buffer[:data].null? || data_size.zero?
        gd_buffer[:data] = nil
        FFI::Mapscript.msSetError(FFI::Mapscript::MS_MISCERR, 'Failed to get image buffer', 'bytes/getBytes')
        return ''
      end

      gd_buffer[:data].read_bytes(data_size)
    end
    alias_method :getBytes, :bytes

    def size
      gd_buffer = build_populated_gd_buffer
      data_size = gd_buffer[:size].null? ? 0 : gd_buffer[:size].read_int

      if gd_buffer[:data].null? || data_size.zero?
        gd_buffer[:data] = nil
        FFI::Mapscript.msSetError(FFI::Mapscript::MS_MISCERR, 'Failed to get image buffer size', 'size/getSize')
        return ''
      end

      data_size
    end
    alias_method :getSize, :size

    private

    def build_populated_gd_buffer
      gd_buffer = FFI::Mapscript::GDBuffer.new

      gd_buffer[:owns_data] = true
      gd_buffer[:size] = FFI::MemoryPointer.new(:int)
      gd_buffer[:data] = FFI::Mapscript.msSaveImageBuffer(@c_struct, gd_buffer[:size], @c_struct[:format])

      gd_buffer
    end
  end
end
