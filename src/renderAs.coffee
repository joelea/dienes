require('./styles/app.less')
h = require('virtual-dom').h
_ = require('lodash')

module.exports = (contents, selectors) -> (count) ->
  h selectors, _.range(count).map(-> contents)
