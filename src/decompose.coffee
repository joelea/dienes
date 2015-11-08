_ = require('lodash')

ERROR = {error: true}

recurse = (n, columns) ->
  return {} if n is 0 or columns.length is 0
  lastDigit = n % 10
  thisColumnName = columns.pop()
  thisColumn = {}
  if(lastDigit > 0) then thisColumn[thisColumnName] = lastDigit
  return _.assign thisColumn, recurse(Math.floor(n/10), columns)

decompose = (rawNumber) ->
  return ERROR unless rawNumber.match /^\d+$/
  return ERROR if rawNumber.length >4
  number = Number.parseInt(rawNumber)
  return recurse(number, ['hundreds', 'tens', 'ones'])

module.exports = decompose
