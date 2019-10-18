
function brokendnasearch(root, dna, i=1)
  if i > length(dna)
    return root.count
  end
  if dna[i] == '?'
    result = 0
    for node in keys(root.children)
      result += brokendnasearch(root.children[node], dna, i+1)
    end
    return result
  elseif haskey(root.children, dna[i])
    return brokendnasearch(root.children[dna[i]], dna, i+1)
  end
  return 0
end
