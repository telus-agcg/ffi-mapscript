require 'rack'

module Rack
  class Mapserver
    def initialize(map_file_path)
      @map = Mapscript::Map.new(map_file_path)
    end

    def call(env)
        # request = ::Rack::Request.new env
        # map_file = request.params['map']
        # map_file ||= 'base.map'
        # map_path = "mapserver/#{File.basename(map_file)}"
        # raise 'MAP file not found' unless File.exists?(map_path)
        #
        # file_name = env['action_dispatch.request.path_parameters'][:file_name]
        # file_format = env['action_dispatch.request.path_parameters'][:format]
        #
        # # copy environment
        # raise 'QUERY_STRING is required' if env['QUERY_STRING'] == ''
        # req = Mapscript::OWSRequest.new
        # %w(REQUEST_METHOD QUERY_STRING HTTP_COOKIE).each { |var| ENV[var] = env[var] }
        # req.loadParams
        #
        # # load map file and update data layer
        # wms = Mapscript::MapObj.new(map_path)
        # if file_name
        #   data_path = "/tmp/#{File.basename(file_name)}.#{file_format}"
        #   raise 'DATA file not found' unless File.exists?(data_path)
        #   wms.getLayerByName('data').data = data_path
        # end
        #
        # # redirect stdout & handle request
        # Mapscript::msIO_installStdoutToBuffer()
        # retval = wms.OWSDispatch(req)
        # content_type = Mapscript::msIO_stripStdoutBufferContentType()
        # map_image = Mapscript::msIO_getStdoutBufferBytes()
        # Mapscript::msIO_resetHandlers()
        #
        # [ 200, { 'Content-Type' => content_type }, Agrian::Rack::StringStreamer.new(map_image) ]
      request = Mapserver::CGIRequest.new
      %w(REQUEST_METHOD QUERY_STRING HTTP_COOKIE).each { |var| ENV[var] = env[var] }
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
