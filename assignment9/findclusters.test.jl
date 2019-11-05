include("findset.jl")



### Tester ###
# Disse testene blir kjørt når du kjører filen
# Du trenger ikke å endre noe her, men du kan eksperimentere!

printstyled("\n\n\n---------------\nKjører tester!!\n---------------\n"; color = :magenta)


using Test
@testset "Tester" begin
    @test sort([sort(x) for x in findclusters([(1, 3, 4), (3, 1, 3), (5, 1, 4), (6, 2, 1), (7, 2, 3), (8, 3, 1), (9, 3, 2),
    (10, 4, 1), (11, 4, 2), (12, 4, 3), (4, 2, 4), (2, 1, 2)], 4, 2)]) == sort([[1, 2], [3, 4]])
    @test sort([sort(x) for x in findclusters([(1, 3, 4), (3, 1, 3), (5, 1, 4), (6, 2, 1), (7, 2, 3), (8, 3, 1), (9, 3, 2),
    (10, 4, 1), (11, 4, 2), (12, 4, 3), (4, 2, 4), (2, 1, 2)], 4, 3)]) == sort([[1], [2], [3, 4]])
end

println("\nFungerte det? Prøv å kjør koden i inginious!")
println("Husk at disse testene ikke sjekker alle grensetilfellene")
println("---------------------------------------------------------\n\n")
