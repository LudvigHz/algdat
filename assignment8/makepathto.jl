using DataStructures: Queue, enqueue!, dequeue!

mutable struct Node
    i::Int
    j::Int
    floor::Bool
    neighbors::Array{Node}
    color::Union{String,Nothing}
    distance::Union{Int,Nothing}
    predecessor::Union{Node,Nothing}
end
Node(i, j, floor=true) = Node(i, j, floor, [], nothing, nothing, nothing)


function makepathto(goalnode)

  path = Array{Tuple{Int, Int}}(undef, 0)

  current = goalnode

  while !isnothing(current)
    prepend!(path, [(current.i, current.j)])
    current = current.predecessor
  end

  return path

end
