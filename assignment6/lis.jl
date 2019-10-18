function lis(s, mls)
  ml = maximum(mls)
  lis = zeros(Int, ml)

  for i = length(mls):-1:1
    if mls[i] == ml
      lis[ml] = s[i]
      ml -= 1
    end
  end
  return lis
end
