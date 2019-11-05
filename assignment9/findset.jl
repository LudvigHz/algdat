mutable struct DisjointSetNode
  rank::Int
  p::DisjointSetNode
  DisjointSetNode() = (obj = new(0); obj.p = obj;)
end

function findset(x::DisjointSetNode)
  if x.p != x
    x.p = findset(x.p)
  end
  return x.p
end


function union!(x, y)
  set_x = findset(x)
  set_y = findset(y)

  if set_x.rank > set_y.rank
    set_y.p = x
  else
    set_x.p = y
    if set_x.rank == set_y.rank
      set_y.rank += 1
    end
  end
end


function hammingdistance(s1, s2)
  return sum(map(i -> s1[i] != s2[i] ? 1 : 0, 1:length(s1)))
end


function findclusters(E, n, k)
  sort!(E)
  nodes = map(n -> DisjointSetNode(), 1:n)

  tree_edges = []

  for edge in E
    if findset(nodes[edge[2]]) != findset(nodes[edge[3]])
      union!(nodes[edge[2]],nodes[edge[3]])
      append!(tree_edges, [edge])
    end

    if size(tree_edges, 1) + (k - 1) == n-1
      result = []
      for node_key in 1:n
        # Check if the set is in the result
        set_node = findset(nodes[node_key])
        set_node_key = findfirst(x -> x == set_node, nodes)

        found = false
        for tree in result
          if any(t -> t == set_node_key, tree)
            if set_node_key != node_key
              append!(tree, [node_key])
            end
            found = true
            break
          end
        end

        if !found
          if set_node_key == node_key
            append!(result, [[set_node_key]])
          else
            append!(result, [[set_node_key, node_key]])
          end
        end
      end

      return result

    end
  end
end

function findanimalgroups(animals, k)
  n = size(animals, 1)
  E = Array{Tuple{Int, Int, Int}}(undef, Int(n*(n - 1) / 2))

  l = 1
  for i in 1:size(animals, 1)
    for j in i+1:size(animals, 1)
      E[l] = (hammingdistance(animals[i][2], animals[j][2]), i, j)
      l += 1
    end
  end

  groups = findclusters(E, n, k)


  final = []
  for group in groups
    append!(final, [map(x -> animals[x][1], group)])
  end

  return final

end
