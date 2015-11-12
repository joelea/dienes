h = require('virtual-dom').h
_ = require('lodash')

rowContents = (n) -> _.range(n).map -> h 'td'
rows = (n, contents) -> _.range(n).map -> h 'tr', contents
diene = (name, x, y) ->
  h "table.#{name}.diene", rows(x, rowContents(y))

module.exports =
  one: -> diene('one', 1, 1)

  ten: -> diene('ten', 10, 1)

  hundred: -> diene('hundred', 10, 10)
