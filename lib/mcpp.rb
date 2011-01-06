require 'ffi'

module Mcpp
  extend FFI::Library
  ffi_lib "libmcpp"

  # The documentation for this function doesn't even seem to be included
  # with the distribution, but can be found online in a document called
  # "mcpp-porting.html". One version was found at the time of writing at
  # http://mcpp.svn.sourceforge.net/viewvc/mcpp/trunk/doc/mcpp-porting.html
  #
  # An example of how to use mcpp_lib_main() from C can be found at
  # http://mcpp.sourcearchive.com/documentation/2.6.2/testmain_8c-source.html
  attach_function :mcpp_lib_main, [:int, :pointer], :int

  def self.preprocess(*args)
    strptrs = []
    strptrs << FFI::MemoryPointer.from_string("Ruby!") # placeholder for argv[0]
    args.each do |a|
      strptrs << FFI::MemoryPointer.from_string(a.to_s)
    end
    strptrs << nil
  
    # Now load all the pointers into a native memory block
    argv = FFI::MemoryPointer.new(:pointer, strptrs.length)
    strptrs.each_with_index do |p, i|
     argv[i].put_pointer(0,  p)
    end
  
    mcpp_lib_main(strptrs.length - 1, argv)
  end
end
