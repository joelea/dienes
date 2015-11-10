module.exports = ({ones, tens, hundreds, errors}) ->
  if errors? then throw Error(errors)
  return \
    1 * (ones ? 0) +
    10 * (tens ? 0) +
    100 * (hundreds ? 0)
