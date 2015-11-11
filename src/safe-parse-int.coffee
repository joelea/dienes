module.exports = (rawNumber) ->
  number = Number.parseInt(rawNumber)
  return if Number.isNaN(number) then 0 else number