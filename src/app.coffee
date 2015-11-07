attach = require('bacon-dom')
Bacon = require('baconjs')
h = require('virtual-dom').h

setNumberInput = document.getElementById('set-number')
number = Bacon.fromEvent(
  setNumberInput,
  'input',
  (event) -> event.target.value
)

appDom = number.map((n) -> h('p', n))

attach(appDom).to(document.getElementById('app'))