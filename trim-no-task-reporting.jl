# Opt-in closed numeric image: no asynchronous analysis work / stderr monitor.
if Base.JLOptions().trim != 0
    @eval Base errormonitor(t::Task) = t
end
