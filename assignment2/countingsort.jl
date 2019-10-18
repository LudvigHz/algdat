function countingsortletters(A, position)
  C = fill(0, chartodigit('z'))
  B::Array{Union{String, Nothing}, 1} = fill(nothing, size(A))

  for i in 1:size(A, 1)
    C[chartodigit(A[i][position])] += 1
  end

  for i in 2:chartodigit('z')
    C[i] += C[i-1]
  end

  for i in size(A, 1):-1:1
    B[C[chartodigit(A[i][position])]] = A[i]
    C[chartodigit(A[i][position])] -= 1
  end

  return B
end

function chartodigit(char)
  return char - '`'
end
