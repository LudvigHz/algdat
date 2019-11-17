function initialize!(G,s)
  inf = typemax(Float64)

  for v in G.V
    v.d = -inf
  end
  s.d = inf
end

function update!(u, v, w)
  if v.d < min(u.d, w[(u,v)])
    v.d = min(u.d, w[(u,v)])
    v.p = u
  end
end
