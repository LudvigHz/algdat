function certifytsp(path, maxweight, neighbourmatrix)
  if path[1] != path[end]
    return false
  end

  if sort(path[2:end]) != 1:size(neighbourmatrix, 1)
    return false
  end

  prev = path[1]
  weight = 0
  for node in path[2:end]
    weight += neighbourmatrix[prev, node]
    prev = node
  end

  if weight > maxweight
    return false
  end

  return true
end