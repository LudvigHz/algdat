import Base.isnothing
include("utils.jl")

function findindexinlist(linkedlist, index)
  counter = 1
  node = linkedlist
  while !isnothing(node)
    if counter === index
      return node.value
    end
    node = node.next
    counter += 1
  end
  return -1
end
