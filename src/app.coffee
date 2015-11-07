attach = require('bacon-dom')
Bacon = require('baconjs')
h = require('virtual-dom').h

appDom = Bacon.constant(h('p', 'hello bacon!'))

attach(appDom).to(document.getElementById('app'))