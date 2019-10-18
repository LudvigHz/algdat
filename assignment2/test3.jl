# Importing the struct beeing used
# Inside a try-catch to allow it to be defined multiple times
# (Mostly a workaround for some IDEs, you don't have to care about this)
try
    mutable struct NodeDoublyLinked
        prev::Union{NodeDoublyLinked, Nothing} # Er enten forrige node eller nothing
        next::Union{NodeDoublyLinked, Nothing} # Er enten neste node eller nothing
        value::Int # Verdien til noden
    end
catch e end


include("maxofdoublelinkedlist.jl")


### Tests ###
# Disse testene blir kjør når du kjører filen
# Du trenger ikke å endre noe her, men du kan eksperimentere!

## Simple doubly linked chain
# Generated from the tail of the list
#                     prev     next     value
n3 = NodeDoublyLinked(nothing, nothing, 100)
n2 = NodeDoublyLinked(nothing, n3, 10)
n1 = NodeDoublyLinked(nothing, n2, 1)
n3.prev = n2
n2.prev = n1

using Test
printstyled("\n\n---------------\nKjører tester!!\n---------------\n"; color = :magenta)
@testset "Basic tests" begin
    @test @time maxofdoublelinkedlist(n1) == 100
    @test @time maxofdoublelinkedlist(n2) == 100
    @test @time maxofdoublelinkedlist(n3) == 100
end

println("\nFungerte alt? Prøv å kjør koden i inginious!")
println("Husk at disse testene ikke alltid sjekker alle edge-cases")
println("---------------------------------------------------------\n\n\n\n")
