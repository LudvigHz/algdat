function schulze_ranking(preference_matrix, canditates)
  # Set slimmest edges to 0 between node pairs
  println(preference_matrix)
  for i in 1:canditates
    for j in i:canditates
      if preference_matrix[i,j] < preference_matrix[j,i]
        preference_matrix[i,j] = 0
      else
        preference_matrix[j,i] = 0
      end
    end
  end
     
  print("PREF: \t\t")
  println(preference_matrix)

  # Run floyd-warshalls
  path_matrix = floyd_warshall(preference_matrix, canditates, max, min)

  println(path_matrix)

  # Find ranking based on widest path
  vote_sums = Dict(i => 0 for i in 1:canditates)

  for i in 1:canditates
    for j in 1:canditates
      if path_matrix[i,j] > path_matrix[j,i]
        vote_sums[i] += 1
      end
    end
  end


  return string(map(x -> Char(64 + x[1]), sort(collect(vote_sums), by = x -> x[2], rev=true))...)
end