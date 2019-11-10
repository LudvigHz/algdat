using DataStructures: PriorityQueue, enqueue!, dequeue!

function general_dijstra(G, w, s, reverse=false)
  initialize!(G, s)

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
    for v in G.Adj[current]
      update!(current, v, w)
    end
  end
end
