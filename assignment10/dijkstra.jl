using DataStructures: PriorityQueue, enqueue!, dequeue!

function general_dijkstra!(G, w, s, reverse=false)
  initialize!(G, s)

  s = Set()

  if reverse
    queue = PriorityQueue(Base.Order.Reverse)
    for u in G.V
      enqueue!(queue, u => u.d)
    end
  else
    queue = PriorityQueue(u => u.d for u in G.V)
  end

  while !isempty(queue)
    current = dequeue!(queue)
    union!(s, [current])
    for v in setdiff(G.Adj[current], s)
      update!(current, v, w)
    end
  end
end
