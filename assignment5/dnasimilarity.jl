
function dnasimilarity(s1, s2)
  return sum(map(i -> s1[i] == s2[i] ? 1 : 0, 1:length(s1)))
end
