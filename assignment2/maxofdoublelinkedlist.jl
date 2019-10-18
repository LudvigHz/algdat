
function maxofdoublelinkedlist(likedlist)

  basenode = likedlist
  max = basenode.value

  currentnode = basenode

  while !isnothing(currentnode.next)
    currentnode = currentnode.next
    if currentnode.value > max
      max = currentnode.value
    end
  end

  while !isnothing(currentnode.prev)
    currentnode = currentnode.prev
    if currentnode.value > max
      max = currentnode.value
    end
  end

  return max

end
