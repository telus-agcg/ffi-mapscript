require 'ffi'

module FFI
  module Mapscript
    extend FFI::Library
    ffi_lib 'mapserver'

    OWSServiceType = enum :OWS_WMS, 1,
      :OWS_WFS, 2

    attach_function :msOWSDispatch, [MapObj.ptr, CGIRequestObj.ptr, :int], :int
    attach_function :msOWSLookupMetadata,
      [HashTableObj.ptr, :string, :string],
      :string
    attach_function :msOWSLookupMetadataWithLanguage,
      [HashTableObj.ptr, :string, :string, :string],
      :string
    attach_function :msOWSLookupMetadata2,
      [HashTableObj.ptr, HashTableObj.ptr, :string, :string],
      :string
    attach_function :msOWSRequestIsEnabled,
      [MapObj.ptr, LayerObj.ptr, :string, :string, :int],
      :int
    attach_function :msOWSRequestLayersEnabled,
      [MapObj.ptr, :string, :string, OWSRequestObj.ptr],
      :void
    attach_function :msOWSParseRequestMetadata,
      [:string, :string, :pointer],
      :int
    attach_function :msOWSParseVersionString, [:string], :int
    attach_function :msOWSGetVersionString, [:int, :buffer_in], :string
    # There's more functions to add...

  end
end
