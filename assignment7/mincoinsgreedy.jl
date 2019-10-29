function mincoinsgreedy(coins, value)

  result = 0
  coins_len = size(coins, 1)
  rest = value

  for i in 1:coins_len
    result += rest ÷ coins[i]
    rest = rest % coins[i]
  end

  return result

end
