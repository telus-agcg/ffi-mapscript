# require 'mapscript'
require './lib/ffi-mapscript'
# require './lib/ffi-mapscript/map'
# require './lib/ffi-mapscript/cgi_request'

def test_cgi_request
  path = '/Users/sloveless/Development/agrian/ffi-gdal/spec/support/images/osgeo/geotiff/gdal_eg/cea.tif'
  map = Mapscript::Map.new(path)

  request = Mapscript::CGIRequest.new
  # #%w(REQUEST_METHOD QUERY_STRING HTTP_COOKIE).each { |var| ENV[var] = env[var] }
  # request.load_params
  #
  # FFI::Mapscript.msIO_installStdoutToBuffer
  #
  # response = map.ows_dispatch(request.c_pointer)
  # puts "response: #{response}"
  #
  # content_type = FFI::Mapscript.msIO_stripStdoutBufferContentType
  # puts "content_type: #{content_type}"
  #
  # map_image = FFI::Mapscript.msIO_getStdoutBufferBytes
  # puts "map_image: #{map_image}"
  #
  # FFI::Mapscript.msIO_resetHandlers
  request.load_params
  request.read_from_stdout(map) do |map_image, content_type, status|
    puts "map_image: #{map_image}"
    puts "content_type: #{content_type}"
    puts "status: #{status}"
  end
end

require 'irb'

def test_map_obj
  map_file = '../../agrian/core/mapserver/field_map_report.map'

  map_obj = Mapscript::MapObj.new(map_file)
  map_obj.width = 100
  map_obj.height = 100

  puts "width: #{map_obj.width}"
  puts "height: #{map_obj.height}"
  binding.irb
end

test_map_obj
