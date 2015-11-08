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
errorStatus = decomposition.map('.errors').log()

appDom = decomposition.map(render)
errorDom = errorStatus.map(renderErrors)

dom = appDom.combine errorDom, (app, error) ->
  h '.content', [
    error
    app,
  ]

attach(dom).to(document.getElementById('app'))
