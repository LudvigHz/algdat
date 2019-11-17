function floyd_warshall(adjacency_matrix, nodes, f, g)
  new = copy(adjacency_matrix)
  for k in 1:nodes
    for i in 1:nodes
      for j in 1:nodes
        new[i, j] =  f(new[i, j], g(new[i, k], new[k, j]))
      end
    end
  end
  return new
end
