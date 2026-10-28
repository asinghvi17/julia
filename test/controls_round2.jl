using Test
@testset "specialized output color callback" begin
    for color in (:red,:normal),styled in (false,true)
        io=IOBuffer();context=IOContext(io,:color=>styled)
        value=Ref(8)
        r=Base.with_output_color((out,x)->(print(out,"value=",x[]);x[]+1),color,context,value)
        @test r==9
        @test occursin("value=8",String(take!(io)))
    end
end
