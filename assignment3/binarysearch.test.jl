include("./binarysearch.jl")

### Tests ###
# Disse testene blir kjør når du kjører filen
# Du trenger ikke å endre noe her, men du kan eksperimentere!

printstyled("\n\n---------------\nKjører tester!!\n---------------\n"; color = :magenta)

using Test
@testset "Basic tests" begin
    @test @time binaryintervalsearch([1 2; 2 3; 3 0; 4 0; 5 1], 1.5, 1) == (2, 4)
    @test @time binaryintervalsearch([1 0; 2 0; 2 0; 3 0; 4 0; 5 0; 5 0], 1, 1) == (2, 5)
    @test @time binaryintervalsearch([1 2; 2 0; 3 3; 4 4], 0.25, 1) == (-1, -1) # Tom mengde
    @test @time binaryintervalsearch([2 1; 3 2; 0 3; 0 4; 1 5], 1.5, 2) == (2, 4)

end

println("\nFungerte alt? Prøv å kjør koden i inginious!")
println("Husk at disse testene ikke alltid sjekker alle edge-cases")
println("---------------------------------------------------------\n\n\n\n\n")
