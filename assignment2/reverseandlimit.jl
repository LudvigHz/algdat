import Base.Iterators.reverse
import Base: map, collect

# function reverseandlimit(array, maxnumber)

  # result = []
  # for i in reverse(array)
    # push!(result, i < maxnumber ? i : maxnumber)
  # end
  # return result
# end



function reverseandlimit(array, maxnumber)
  # Create an iterator that is the reverse of array, map and collect!
  return collect(Int, map(x -> x > maxnumber ? maxnumber : x, reverse(array)))
end
