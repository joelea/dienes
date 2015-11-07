module.exports =
  'add a decomposition' : (browser) ->
    browser
      .url('http://dienes')
      .waitForElementVisible('[ete-set-number]')
      .setValue('[ete-set-number]', '321')

    browser.expect.element('.hundred').to.be.visible
    browser.expect.element('.ten').to.be.visible
    browser.expect.element('.one').to.be.visible

    browser.end()
