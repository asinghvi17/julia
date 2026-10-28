# Class (b), explicit serial numeric-image policy. Real setup initializers ran already.
# Distributed is loaded by SciMLBase, but these entries never create/use workers.
# Its replay initializer starts task/error-display machinery unrelated to these entries.
if Base.JLOptions().trim != 0
    for (id,mod) in Base.loaded_modules
        if id.name == "Distributed"
            Core.eval(mod, :(__init__() = nothing))
        end
    end
end
