_ = require('lodash')

ERROR = {error: true}

validityChecks = [
  (raw) -> not raw.match /^\d+$/
  (raw) -> raw.length > 4
]

inputIsInvalid = (rawNumber) ->
  _.any(validityChecks, (check) -> check(rawNumber))

recurse = (n, columns) ->
  return {} if n is 0 or columns.length is 0
  lastDigit = n % 10
  thisColumnName = columns.pop()
  thisColumn = {}
  if(lastDigit > 0) then thisColumn[thisColumnName] = lastDigit
  return _.assign thisColumn, recurse(Math.floor(n/10), columns)

decompose = (rawNumber) ->
  return ERROR if inputIsInvalid(rawNumber)
  number = Number.parseInt(rawNumber)
  return recurse(number, ['hundreds', 'tens', 'ones'])

module.exports = decompose
