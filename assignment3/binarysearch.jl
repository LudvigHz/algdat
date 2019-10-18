
function binaryintervalsearch(x, delta, coordinate)

  axis = x[:, coordinate]

  len = size(axis, 1)

  median = len % 2.0 == 0 ? sum(axis[Int(len/2):Int(len/2+1)])/2 : axis[ceil(Int,(len/2))]

  lower = median - delta
  upper = median + delta

  index_lower = binarysearchlower(axis, 1, len, lower)
  index_upper = binarysearchupper(axis, 1, len, upper)

  if (index_lower > 0 && axis[index_lower] > upper || axis[index_upper] < lower)
    return (-1, -1)
  end

  return (index_lower, index_upper)

end


function binarysearchlower(x, a, b, e)
  if b > a
    if x[floor(Int, (b+a)/2)] >= e
      return binarysearchlower(x, a, floor(Int, (b+a)/2), e)
    else
      return binarysearchlower(x, floor(Int, (b+a)/2)+1, b, e)
    end
  end
  return x[a] >= e ? a : -1
end


function binarysearchupper(x, a, b, e)
  if b > a
    if x[ceil(Int, (b+a)/2)] <= e
      return binarysearchupper(x, ceil(Int, (b+a)/2), b, e)
    else
      return binarysearchupper(x, a, ceil(Int, (b+a)/2)-1, e)
    end
  end
  return x[a] <= e ? a : -1
end
