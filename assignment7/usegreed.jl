function usegreed(coins)
  for i in 1:size(coins, 1)-1
    if coins[i] % coins[i+1] !=0
      return false
    end
  end
  return true
end
