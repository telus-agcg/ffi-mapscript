require 'rack'

module Rack
  class Mapscript
    def initialize(map_file_path)
      @map = ::Mapscript::Map.new(map_file_path)
    end

    def call(env)
      request = ::Mapscript::CGIRequest.new

      %w(REQUEST_METHOD QUERY_STRING HTTP_COOKIE).each do |var|
        ENV[var] = env[var]
      end

      request.load_params
      request.read_from_stdout(@map) do |map_image, content_type, status|
        puts "map_image: #{map_image}"
        puts "content_type: #{content_type}"
        puts "status: #{status}"

        [200, { 'Content-Type' => content_type }, map_image]
      end
    end
  end
end
