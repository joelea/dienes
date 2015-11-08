attach = require('bacon-dom')
Bacon = require('baconjs')
h = require('virtual-dom').h
decompose = require('./decompose')
render = require('./render')

setNumberInput = document.getElementById('set-number')
number = Bacon.fromEvent(
  setNumberInput,
  'input',
  (event) -> event.target.value
).startWith(setNumberInput.value)

decomposition = number.map(decompose)

appDom = decomposition.map(render)

attach(appDom).to(document.getElementById('app'))
