_ = require('lodash')

validityChecks = [
  (raw) -> if raw.match /[^\d]/ then return "Sorry, #{raw} is not a number"
  (raw) -> if raw.length > 3 then return 'Sorry, we can only deal with up to 4-digit numbers'
]

inputErrors = (rawNumber) ->
  validityChecks.map (check) -> check(rawNumber)

recurse = (n, columns) ->
  return {} if n is 0 or columns.length is 0
  lastDigit = n % 10
  thisColumnName = columns.pop()
  thisColumn = {}
  if(lastDigit > 0) then thisColumn[thisColumnName] = lastDigit
  return _.assign thisColumn, recurse(Math.floor(n/10), columns)

decompose = (rawNumber) ->
  errors = inputErrors(rawNumber).filter((error) -> error?)
  if not _(errors).isEmpty() then return {errors}
  number = Number.parseInt(rawNumber)
  return recurse(number, ['hundreds', 'tens', 'ones'])

module.exports = decompose
