module MyLocalTest

# Write your package code here.

using Libdl

const lib_dftd4_name = "libdftd4.so.3.4.0"
mutable struct LibDftd4
    handle::Union{Nothing, Ptr{Nothing}}
end
const lib_dftd4 = LibDftd4(nothing)

include("library.jl")
include("fwrapper.jl")

end
