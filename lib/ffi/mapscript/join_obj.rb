require 'ffi'

module FFI
  module Mapscript
    extend FFI::Library

    class JoinObj < FFI::Struct
      layout :name, :string,
        :items, :pointer,     # array of strings
        :values, :pointer,    # array of strings
        :num_items, :int,
        :table, :string,
        :from, :string,
        :to, :string,
        :join_info, :pointer,
        :header, :string,
        :footer, :string,
        :template, :string,
        :type, MS_JOIN_TYPE,
        :connection, :string,
        :connection_type, MS_JOIN_CONNECTION_TYPE
    end
  end
end
