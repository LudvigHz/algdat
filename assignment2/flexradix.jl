include("countingsort.jl")
include("countingsortlen.jl")

function flexradix(A, maxlength)

  sorted = countingsortlength(A)

  len = size(A, 1)

  index = len
  for i in maxlength:-1:1
    while index > 1 && length(sorted[index-1]) >= i
      index -= 1
    end
    sorted[index:end] = countingsortletters(sorted[index:end], i)

  end
  return sorted
end
