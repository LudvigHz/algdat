include("usegreed.jl")
include("mincoinsgreedy.jl")

function mincoins(coins, value, memo=nothing)

  usableCoins = filter(x -> x <= value, coins)
  if usegreed(usableCoins)
    return mincoinsgreedy(usableCoins, value)
  end

  len = length(coins)
  if memo == nothing
    memo = fill(typemax(Int), value)
  end
  q = typemax(Int)

  # Dynamic version
  for i in 1:len

    if coins[i] > value
      continue
    end

    if coins[i] == value
      q = 0
      break
    end

    if memo[value-coins[i]] == typemax(Int)
      memo[value-coins[i]] = mincoins(coins, value-coins[i], memo)
    end

      q = min(q, memo[value-coins[i]])

  end

  return q + 1
end
