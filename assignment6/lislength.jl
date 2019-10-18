function lislength(s)

  mls = fill(1, size(s))
  mls[1] = 1

  for i in 2:length(s)
    for j in 1:i-1
      a = mls[j]
      if s[j] < s[i] && a + 1 > mls[i]
        mls[i] = a + 1
      end
    end
  end

  return maximum(mls)
end
