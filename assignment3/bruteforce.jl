
function bruteforce(x)
  return brute(x, Inf)
end

function brute(x, dist)
  for i in 2:size(x, 1)
    for j in i:size(x,1)
      local_dist =  distance(x[1,:], x[i, :])
      if local_dist < dist
        dist = local_dist
      end
    end
  end
  return dist
end


function distance(a, b)
  return sqrt(abs(a[1] - b[1])^2 + abs(a[2] - b[2])^2)
end
