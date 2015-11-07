module.exports = (n) ->
  if(n == 0) then return {}
  if (n % 10) == 0
    return tens: (n / 10)
  return ones: n
