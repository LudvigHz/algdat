include("floyd_warshall.jl")
include("schulze_ranking.jl")

### Tester ###
# Disse testene blir kjørt når du kjører filen
# Du trenger ikke å endre noe her, men du kan eksperimentere!

D = [0 7 2; Inf 0 Inf; Inf 4 0]

printstyled("\n\n\n---------------\nKjører tester\n---------------\n"; color = :magenta)

using Test
@testset "Tester" begin

  @test schulze_ranking([0 1 2; 2 0 2; 1 1 0], 3) == "BAC"
  @test schulze_ranking([0 11 20 14; 19 0 9 12; 10 21 0 17; 16 18 13 0], 4) == "DACB"
end

println("\nFungerte alt? Prøv å kjør koden i inginious!")
println("Husk at disse testene ikke alltid sjekker alle edge-cases")
println("---------------------------------------------------------\n\n")
