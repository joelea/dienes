attach = require('bacon-dom')
Bacon = require('baconjs')
h = require('virtual-dom').h
createElement = require('virtual-dom').create
decompose = require('./decompose')
recompose = require('./recompose')
renderAs = require('./renderAs')
initialDom = require('./initial-dom')
safeParseInt = require('./safe-parse-int')
diene = require('./diene')

document.getElementById('app').appendChild(createElement(initialDom()))
setNumberInput = document.getElementById('set-number')

inputsTo = (input) ->
  Bacon.fromEvent(
    input,
    'input',
    (event) -> event.target.value
  )
  .startWith(input.value)
  .map(safeParseInt)

number = inputsTo(setNumberInput)

onesInput = document.getElementById('ones-input')
tensInput = document.getElementById('tens-input')
hundredsInput = document.getElementById('hundreds-input')

subDecomposition = Bacon.mergeAll(
  inputsTo(onesInput),
  inputsTo(tensInput),
  inputsTo(hundredsInput)
).map( ->
  ones: safeParseInt(onesInput.value)
  tens: safeParseInt(tensInput.value)
  hundreds: safeParseInt(hundredsInput.value)
)

decomposition = Bacon.mergeAll(
  number.map(decompose),
  subDecomposition
)

decomposition.onValue (decomp) ->
  setNumberInput.value = recompose(decomp)
  onesInput.value = decomp.ones ? 0
  tensInput.value = decomp.tens ? 0
  hundredsInput.value = decomp.hundreds ? 0

ones = decomposition.map('.ones')
tens = decomposition.map('.tens')
hundreds = decomposition.map('.hundreds')

onesDom = ones.map(renderAs(diene.one(), '.ones'))
tensDom = tens.map(renderAs(diene.ten(), '.tens'))
hundredsDom = hundreds.map(renderAs(diene.hundred(), '.hundreds'))

attach(onesDom).to(document.getElementById('ones-anchor'))
attach(tensDom).to(document.getElementById('tens-anchor'))
attach(hundredsDom).to(document.getElementById('hundreds-anchor'))
