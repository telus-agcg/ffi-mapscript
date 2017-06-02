require 'ffi'

module FFI
  module Mapscript
    extend FFI::Library

    class ScaleTokenObj < FFI::Struct
      layout :name, :string,
      :n_entries, :int,
      :tokens, ScaleTokenEntryObj.ptr
    end
  end
end
