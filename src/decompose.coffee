_ = require('lodash')

decompose = (n) ->
  if(n == 0) then return {}
  if (n >= 10) then return _.assign {tens: Math.floor(n / 10)}, decompose( n % 10 )
  return ones: n

module.exports = decompose
