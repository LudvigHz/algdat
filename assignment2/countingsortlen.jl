function countingsortlength(A)
  C = fill(0, 100)
  B::Array{Union{String, Nothing}, 1} = fill(nothing, size(A,1))

  for i in 1:size(A, 1)
    len = length(A[i])+1
    if len > size(C, 1)
      C = vcat(C, fill(0, len))
    end
    C[length(A[i])+1] += 1
  end

  for i in 2:size(C,1)
    C[i] += C[i-1]
  end

  for i in size(A, 1):-1:1
    B[C[length(A[i])+1]] = A[i]
    C[length(A[i])+1] -= 1
  end

  print(B)
  return B
end
