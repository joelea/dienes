assertNumberOfElements = (browser, selector, count) ->
  browser.elements 'css selector', selector, (result) ->
    browser.assert.equal(result.value.length, count);

module.exports =
  'add a decomposition' : (browser) ->
    browser
      .url('http://dienes')
      .waitForElementVisible('.ete-set-number')
      .pause(100)
      .setValue('.ete-set-number', '321')
      .waitForElementVisible('.hundred')

    assertNumberOfElements(browser, '.hundred', 3)
    assertNumberOfElements(browser, '.ten', 2)
    assertNumberOfElements(browser, '.one', 1)

    browser.end()
