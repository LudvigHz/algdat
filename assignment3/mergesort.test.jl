include("./mergesort.jl")


### Tests ###
# Disse testene blir kjør når du kjører filen
# Du trenger ikke å endre noe her, men du kan eksperimentere!

printstyled("\n\n---------------\nKjører tester!!\n---------------\n"; color = :magenta)

using Test
println("Kjører testene for mergeararys!")
@testset "Basic tests for mergeararys" begin
    @test @time mergearrays([1 0; 3 0], [2 0; 4 0], 1) == [1 0; 2 0; 3 0; 4 0]
    @test @time mergearrays([1 0; 4 0], [2 0; 3 0], 1) == [1 0; 2 0; 3 0; 4 0]
end

println("\n--------------------------------------------\n")

println("Kjører testene for mergesort!")
println("Husk at om du gir et array med float, any, eller int, gjør det ikke noe.\n")
@testset "Basic tests for mergesort" begin
    @test @time mergesort([4 0; 3 0; 1 0; 2 0],1) == [1 0; 2 0; 3 0; 4 0]
    @test @time mergesort([1 2; 4 6; 2 1],1) == [1 2; 2 1; 4 6]
    @test @time mergesort([1 2; 4 6; 2 1],2) == [2 1; 1 2; 4 6]
end

println("\nFungerte alt? Prøv å kjør koden i inginious!")
println("Husk at disse testene ikke alltid sjekker alle edge-cases")
println("---------------------------------------------------------\n\n\n\n\n")
