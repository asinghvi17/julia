# Native image only: these runtime services are not used by the serial/no-IO entry.
import Pkg,Distributed
for mod in (Distributed,Base.get_extension(Pkg,:REPLExt))
    if mod !== nothing && isdefined(mod,:__init__)
        Core.eval(mod,:(__init__()=nothing))
    end
end
