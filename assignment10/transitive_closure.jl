function transitive_closure(adjacency_matrix, nodes)
  new = map(x -> x == Inf ? 0 : 1,adjacency_matrix)
  return floyd_warshall(new, nodes, (a,b) -> a != 0 || b != 0 ? 1 : 0, (a,b) -> a != 0 && b != 0 ? 1 : 0)
end