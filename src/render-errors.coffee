h = require('virtual-dom').h
_ = require('lodash')

NO_ERRORS = h '.no-errors', []

renderSingle = (error) -> return h('p.error', String(error))

module.exports = (errors) ->
  return unless errors?
  return NO_ERRORS if _.isEmpty errors
  return h '.errors', _.map(errors, renderSingle)
