
function searchtree(root, dna)
  currentnode = root
  len = length(dna)
  for i in 1:len
    next = dna[i]
    if !haskey(currentnode.children, next)
      return 0
    end
    currentnode = currentnode.children[next]
  end
  return currentnode.count
end
