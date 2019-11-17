include("floyd_warshall.jl")
include("transitive_closure.jl")

### Tester ###
# Disse testene blir kjørt når du kjører filen
# Du trenger ikke å endre noe her, men du kan eksperimentere!

D = [0 7 2; Inf 0 Inf; Inf 4 0]

printstyled("\n\n\n---------------\nKjører tester\n---------------\n"; color = :magenta)

using Test
@testset "Tester" begin

  @test transitive_closure(D, 3) == [1 1 1; 0 1 0; 0 1 1]
end

println("\nFungerte alt? Prøv å kjør koden i inginious!")
println("Husk at disse testene ikke alltid sjekker alle edge-cases")
println("---------------------------------------------------------\n\n")
