using Base.Iterators: flatten, filter

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


### Du skal implementere denne funksjonen ###
function mazetonodelist(maze)
    # Vi lager en matrise nodearray med størrelse tilsvarende maze,
    # men med Node-objekter isteden
    nodearray = Array{Node}(undef, size(maze, 1), size(maze, 2))

    for i in 1:size(maze, 1)
        for j in 1:size(maze, 2)
          nodearray[i, j] = Node(i, j, maze[i,j] == 1)
        end
    end

    for i in 1:size(maze, 1)
        for j in 1:size(maze, 2)
          if i < size(maze, 1) && nodearray[i+1, j].floor
            append!(nodearray[i,j].neighbors, [nodearray[i+1, j]])
          end
          if i > 1 && nodearray[i-1, j].floor
            append!(nodearray[i,j].neighbors, [nodearray[i-1, j]])
          end
          if j > 1 && nodearray[i, j-1].floor
            append!(nodearray[i,j].neighbors, [nodearray[i, j-1]])
          end
          if j < size(maze, 2) && nodearray[i, j+1].floor
            append!(nodearray[i,j].neighbors, [nodearray[i, j+1]])
          end
        end
    end

    return collect(Node, filter(x -> x.floor, vcat(nodearray)))
end
