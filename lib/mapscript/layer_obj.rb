module Mapscript
  class LayerObj
    def initialize(c_pointer)
      @c_struct = FFI::Mapscript::LayerObj.new(c_pointer)
      @c_struct[:features] = FFI::Mapscript::FeatureListNodeObj.new if @c_struct[:features].null?
    end

    # @param shape_obj [Mapscript::ShapeObj]
    # @return [FFI::Mapscript::FeatureListNodeObj]
    def add_feature(shape_obj)
      shape_obj.index = if !@c_struct[:features].null? && !@c_struct[:features][:tail_if_head].null?
                          @c_struct[:features][:tail_if_head][:shape][:index] + 1
                        else
                          0
                        end

      FFI::Mapscript.insertFeatureList(@c_struct[:features].pointer, shape_obj.c_struct.pointer)
    end
    alias_method :addFeature, :add_feature

    def data=(new_data)
      @c_struct[:data] = FFI::MemoryPointer.from_string(new_data)
    end

    def data
      @c_struct[:data].read_string
    end

    # @return [FFI::Mapscript::RectObj]
    def extent
      extent = FFI::Mapscript::RectObj.new

      result = FFI::Mapscript.msLayerGetExtent(@c_struct, extent)
      byebug

      extent
    end
  end
end
