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


### Du skal implementere denne funksjonen ###
function bfs!(nodes, start)
  for node in nodes
    node.color = "white"
  end

  start.color = "gray"
  start.distance = 0
  queue = Queue{Node}()

  enqueue!(queue, start)

  while !isempty(queue)
    current = dequeue!(queue)

    for node in current.neighbors
      if node.color == "white"
        node.color = "gray"
        node.distance = current.distance + 1
        node.predecessor = current
        if isgoalnode(node)
          return node
        end
        enqueue!(queue, node)
      end
    end

    current.color = "black"

  end

  return nothing

end
