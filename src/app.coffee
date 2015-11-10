attach = require('bacon-dom')
Bacon = require('baconjs')
h = require('virtual-dom').h
decompose = require('./decompose')
render = require('./render')
renderErrors = require('./render-errors')

setNumberInput = document.getElementById('set-number')
number = Bacon.fromEvent(
  setNumberInput,
  'input',
  (event) -> event.target.value
)

decomposition = number.map(decompose)
decomposition.onValue (decomp) -> setNumberInput.value = recompose(decomp)

errorStatus = decomposition.map('.errors')

appDom = decomposition.map(render).startWith(render({}))
errorDom = errorStatus.map(renderErrors).startWith(renderErrors([]))

dom = appDom.combine errorDom, (app, error) ->
  h '.content', [
    error
    app
  ]

attach(dom).to(document.getElementById('app'))
