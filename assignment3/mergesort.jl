
function mergearrays(x,y,coordinate)
  total_len = size(x, 1) + size(y, 1)
  result = fill(0.0, (total_len, 2))

  x = vcat(x, [Inf Inf])
  y = vcat(y, [Inf Inf])

  i = 1
  j = 1
  for k in 1:total_len
    if x[i, coordinate] <= y[j, coordinate]
      result[k,:] = x[i,:]
      i += 1
    else
      result[k,:] = y[j,:]
      j += 1
    end
  end

  return result
end

function mergearrays2(x,y,coordinate)
  total_len = size(x, 1) + size(y, 1)
  result = fill(0, (total_len, 2))

  x = vcat(x, [999999 999999])
  y = vcat(y, [999999 999999])

  i = 1
  j = 1
  for k in 1:total_len
    if x[i, coordinate] <= y[j, coordinate]
      result[k,:] = x[i,:]
      i += 1
    else
      result[k,:] = y[j,:]
      j += 1
    end
  end

  return result
end


## Merge sort

function mergesort(x, coordinate)
  len = size(x, 1)
  result = x
  if len > 1
    half = floor(Int, len/2)
    x1 = mergesort(x[1:half,:], coordinate)
    x2 = mergesort(x[half+1:len,:], coordinate)
    result = mergearrays(x1, x2, coordinate)
  end
  return result
end
