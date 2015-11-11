attach = require('bacon-dom')
Bacon = require('baconjs')
h = require('virtual-dom').h
createElement = require('virtual-dom').create
decompose = require('./decompose')
recompose = require('./recompose')
render = require('./render')
renderErrors = require('./render-errors')
safeParseInt = require('./safe-parse-int')

document.getElementById('app').appendChild(createElement(render({})))
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

errorStatus = decomposition.map('.errors')

appDom = decomposition.map(render).startWith(render({}))
errorDom = errorStatus.map(renderErrors).startWith(renderErrors([]))

dom = appDom.combine errorDom, (app, error) ->
  h '.content', [
    error
    app
  ]

#attach(dom).to(document.getElementById('app'))
