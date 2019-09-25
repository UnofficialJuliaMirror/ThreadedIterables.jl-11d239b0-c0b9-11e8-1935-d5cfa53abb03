module ThreadedMap

include("ensureThreaded.jl")

include("foreach.jl");
include("map.jl");
include("mapreduce.jl");
include("mapfoldl.jl");
include("mapfoldr.jl");
include("reduce.jl");

end