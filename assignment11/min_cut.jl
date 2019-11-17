using DataStructures: Queue, enqueue!, dequeue!
include("max_flow.jl")

function min_cut(source, sink, nodes, capacities)
  flows, tot_flow = max_flow(source, sink, nodes, capacities)

  Q = Queue{Int}()
  enqueue!(Q, source)
  S = [source]

  discovered = zeros(Bool, nodes)
  discovered[source] = true

  while !isempty(Q)
    node = dequeue!(Q)

    for neighbour in 1:nodes
      if !discovered[neighbour] && capacities[node, neighbour] - flows[node, neighbour] > 0
        enqueue!(Q, neighbour)
        push!(S, neighbour)
        discovered[neighbour] = true
      end
    end
  end

  return S, [i for i in 1:nodes if findfirst(x -> x==i, S) == nothing]
end