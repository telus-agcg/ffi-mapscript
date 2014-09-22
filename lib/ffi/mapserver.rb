require 'ffi'
require_relative 'mapserver/version'

module FFI
  module Mapserver
    extend FFI::Library

    ffi_lib 'mapserver'
  end
end
