
function splitintwo(x, y)
  len = size(x, 1)
  half = floor(Int, len/2)
  xleft = fill(0.0, (len-half, 2))
  xright = fill(0.0, (half, 2))
  yleft = fill(0.0, (len-half, 2))
  yright = fill(0.0, (half, 2))

  j = len-half

  for i in 1:size(x,1)
    if i < len-half
      xleft[i, :] = x[i, :]
      if xleft[i, 2] <= y[j, 2]
        temp = yleft[i, :]
        yleft[i, :] = y[j, :]
        y[j, :] = temp
      end
    end
  end

  print("yleft")
  println(yleft)
end
