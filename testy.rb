require './lib/ffi-mapserver'
require './lib/ffi-mapserver/map'
require './lib/ffi-mapserver/cgi_request'

path = '/Users/sloveless/Desktop/geotiffs/NDVI20000701183.tif'
map = Mapserver::Map.new(path)

request = Mapserver::CGIRequest.new
#%w(REQUEST_METHOD QUERY_STRING HTTP_COOKIE).each { |var| ENV[var] = env[var] }
request.load_params
FFI::Mapserver.msIO_installStdoutToBuffer
response = map.ows_dispatch(request.c_pointer)
puts "response: #{response}"

content_type = FFI::Mapserver.msIO_stripStdoutBufferContentType
puts "content_type: #{content_type}"

map_image = FFI::Mapserver.msIO_getStdoutBufferBytes
puts "map_image: #{map_image}"

FFI::Mapserver.msIO_resetHandlers
