include("lislength.jl")


### Tester ###
# Disse testene blir kjør når du kjører filen
# Du trenger ikke å endre noe her, men du kan eksperimentere!

printstyled("\n\n\n---------------\nKjører tester!!\n---------------\n"; color = :magenta)

randomArray = rand([0, 100000], 1000, 1)

using Test
@testset "Tester" begin
	@test @time lislength([5,3,3,6,7]) == 3
	@test @time lislength([2,2,2,2]) == 1
	@test @time lislength([100,50,25,10]) == 1
	@test @time lislength([0, 8, 4, 12, 2, 10, 6, 14, 1, 9, 5, 13, 3, 11, 7, 15]) == 6
	@test @time lislength([682, 52, 230, 441, 1000, 22, 678, 695, 0, 681]) == 5
	@test @time lislength([441, 1000, 22, 678, 695, 0, 681, 956, 48, 587, 604, 857, 689, 346, 425, 513, 476, 917, 114, 43, 327, 172, 162, 76, 91, 869, 549, 883, 679, 812, 747, 862, 228, 368, 774, 838, 107, 738, 717, 25, 937, 927, 145, 44, 634, 557, 850, 965]) == 12
        @time lislength(randomArray)
end

println("\nFungerte alt? Prøv å kjør koden i inginious!")
println("Husk at disse testene ikke alltid sjekker alle edge-cases")
println("---------------------------------------------------------\n\n")
