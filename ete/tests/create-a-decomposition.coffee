module.exports =
  'add a decomposition' : (browser) ->
    browser
      .url('http://dienes')
      .waitForElementVisible('.ete-set-number')
      .setValue('.ete-set-number', '321')

    browser.expect.element('.hundreds').to.be.visible
    browser.expect.element('.tens').to.be.visible
    browser.expect.element('.ones').to.be.visible

    browser.end()
