function backtrack(pathweights)
  rows, cols = size(pathweights)

  index = argmin(pathweights[rows, :])

  path::Array{Tuple{Int64, Int64}} = [(rows, index)]

  for i in rows-1:-1:1

    weight = pathweights[i, index]
    nindex = index

    if index > 1 && pathweights[i, index - 1] <= weight
      weight = pathweights[i, index - 1]
      nindex = index - 1
    end
    if index < cols && pathweights[i, index + 1] < weight
      weight = pathweights[i, index + 1]
      nindex = index + 1
    end
    index = nindex

    push!(path, (i, nindex))
  end
  return path
end
