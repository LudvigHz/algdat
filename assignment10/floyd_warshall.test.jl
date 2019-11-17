include("floyd_warshall.jl")

### Tester ###
# Disse testene blir kjørt når du kjører filen
# Du trenger ikke å endre noe her, men du kan eksperimentere!

D = [0 7 2; Inf 0 Inf; Inf 4 0]

printstyled("\n\n\n---------------\nKjører tester\n---------------\n"; color = :magenta)

using Test
@testset "Tester" begin

  @test floyd_warshall(D, 3, min, +) == [0 6 2; Inf 0 Inf; Inf 4 0]
end

println("\nFungerte alt? Prøv å kjør koden i inginious!")
println("Husk at disse testene ikke alltid sjekker alle edge-cases")
println("---------------------------------------------------------\n\n")
