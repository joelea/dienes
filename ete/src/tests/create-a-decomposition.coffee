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

  'edit a decomposition at the column level' : (browser) ->
    browser
      .url('http://dienes')
      .waitForElementVisible('.ete-set-number')
      .pause(100)
      .setValue('.ete-set-number', '321')
      .clearValue('#hundreds-input')
      .setValue('#hundreds-input', '5')

    browser.expect.element('.ete-set-number').value.to.equal('521')

    assertNumberOfElements(browser, '.hundred', 5)
    assertNumberOfElements(browser, '.ten', 2)
    assertNumberOfElements(browser, '.one', 1)

    browser.end()

