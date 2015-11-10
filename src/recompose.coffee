module.exports = ({ones, tens, hundreds}) ->
  1 * (ones ? 0) +
  10 * (tens ? 0) +
  100 * (hundreds ? 0)
