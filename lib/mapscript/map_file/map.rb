require_relative '../map_file_objects'

module Mapscript
  module MapFileSections
    class Map
      # @param [Float]
      attr_accessor :angle

      attr_reader :config

      # @param [Regexp]
      attr_accessor :data_pattern

      # @param true, false, 1, 2, 3, 4, 5
      attr_accessor :debug

      # @param [Fixnum]
      attr_accessor :def_resolution

      # @param [String]
      attr_accessor :font_set

      # @param [Fixnum]
      attr_accessor :image_quality

      # @param [String]
      attr_accessor :image_type

      # @param [Mapscript::MapFileObjects::Layer]
      attr_accessor :layer

      # @param [Mapscript::MapFileObjects::Legend]
      attr_accessor :legend

      # @param [Fixnum]
      attr_accessor :max_size

      # @param [String]
      attr_accessor :name

      # @param [Mapscript::MapFileObjects::Projection]
      attr_accessor :projection

      # @param [Mapscript::MapFileObjects::QueryMap]
      attr_accessor :query_map

      # @param [Mapscript::MapFileObjects::ReferenceMap]
      attr_accessor :reference

      # @param [Fixnum]
      attr_accessor :resolution

      # @param [Float]
      attr_accessor :scale_denom

      # @param [Mapscript::MapFileObjects::Scalebar]
      attr_accessor :scalebar

      # @param [String]
      attr_accessor :shape_path

      # @param [Mapscript::MapFileObjects::Symbol]
      attr_accessor :symbol


      def initialize
        @config = {}
      end

      def extent(min_x, min_y, max_x, max_y)
      end

      def image_color(red, green, blue)
      end

      # Returns the string if x and y are both not given.
      #
      # @param x [Fixnum]
      # @param y [Fixnum]
      def size(x = nil, y = nil)
        if x && y
          @x = x
          @y = y
        else
          "SIZE #{@x} #{@y}"
        end
      end

      # @param new_status [Symbol] :on or :off
      def status=(new_status)
        unless %i[on off].include? new_status
          warn 'STATUS should be either :on or :off.'
        end

        @status = new_status
      end

      def status
        "STATUS #{@status}"
      end

      # @param file_name [String]
      def symbol_set=(file_name)
        @symbol_set = file_name
      end

      def symbol_set
        "SYMBOLSET #{@symbol_set}"
      end

      # @param [Regexp]
      def template_pattern=(pattern)
        @template_pattern = pattern
      end

      # @
      def template_pattern
        "TEMPLATEPATTERN #{@template_patter}"
      end
    end
  end
end
