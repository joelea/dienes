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
)

isNotError = (decomposition) -> not decomposition.error?

decomposition = number
  .map(decompose)
  .map((decomp) -> if decomp.errors? then {} else decomp)

appDom = decomposition.map(render)#.log("dom")

attach(appDom).to(document.getElementById('app'))
