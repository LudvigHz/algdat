include("findindexinlist.jl")
# Importing the struct beeing used
# Inside a try-catch to allow it to be defined multiple times
# (Mostly a workaround for some IDEs, you don't have to care about this)
try
    mutable struct Node
        next::Union{Node, Nothing} # Next can be a new Node or nothing
        value::Int
    end
catch e end






### Tests ###
# Disse testene blir kjør når du kjører filen
# Du trenger ikke å endre noe her, men du kan eksperimentere!

## Simple linked chain
n3 = Node(nothing, 100)
n2 = Node(n3, 10)
n1 = Node(n2, 1)

using Test
printstyled("\n\n---------------\nKjører tester!!\n---------------\n"; color = :magenta)
@testset "Basic tests" begin
    @test findindexinlist(n1, 1) == 1
    @test findindexinlist(n1, 2) == 10
    @test findindexinlist(n1, 3) == 100
    @test findindexinlist(n1, 4) == -1
    @test findindexinlist(n1, 50) == -1
end

println("\nFungerte alt? Prøv å kjør koden i inginious!")
println("Husk at disse testene ikke alltid sjekker alle edge-cases")
println("---------------------------------------------------------\n\n\n\n")
