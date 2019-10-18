function cumulative(weights)
  rows, cols = size(weights)

  paths = fill(0, (rows, cols))
  paths[1:1, :] = weights[1:1, :]

  for y in 2:rows
    for x in 1:cols
      alts = [paths[y-1, x]]
      if x >= 1 && x < cols
        alts = vcat(alts, paths[y-1, x+1])
      end
      if x <= cols && x > 1
        alts = vcat(alts, paths[y-1, x-1])
      end
      paths[y, x] = weights[y, x] + minimum(alts)
    end
  end

  return paths
end
