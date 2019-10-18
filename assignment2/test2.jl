include("reverseandlimit.jl")




### Tests ###
# Disse testene blir kjør når du kjører filen
# Du trenger ikke å endre noe her, men du kan eksperimentere!

# Helper function in case the argument is modified (IT should not be btw)
function deep(a) return deepcopy(a) end

## Simple array to be used in tests
array = [6,5,4,3,2,1]

using Test
printstyled("\n\n---------------\nKjører tester!!\n---------------\n"; color = :magenta)
@testset "Basic tests" begin
    @test  @time reverseandlimit(deep(array), 3) == [1,2,3,3,3,3]
    @test  @time reverseandlimit(deep(array), 4) == [1,2,3,4,4,4]
    @test  @time reverseandlimit(deep(array), 50) == [1,2,3,4,5,6]
    @test  @time reverseandlimit(deep(array), -1) == [-1,-1,-1,-1,-1,-1]
end

println("\nFungerte alt? Prøv å kjør koden i inginious!")
println("Husk at disse testene ikke alltid sjekker alle edge-cases")
println("---------------------------------------------------------\n\n\n\n")
