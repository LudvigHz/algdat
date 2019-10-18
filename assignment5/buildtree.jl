
function buildtree(dnasequences)
  root = Node()
  root.count = length(dnasequences)
  for dna in dnasequences
    current = root
    for s in dna
      if haskey(current.children, s)
        current = current.children[s]
        current.count += 1
      else
        current.children[s] = Node()
        current = current.children[s]
        current.count = 1
      end
    end
  end
  return root
end
