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

  'displays a sensible error message when the input is not valid' : (browser) ->
    browser
      .url('http://dienes')
      .waitForElementVisible('.ete-set-number')
      .pause(100)
      .setValue('.ete-set-number', '78654')

    browser.expect.element('.error').text
      .to.contain('Sorry, we can only deal with up to 4-digit numbers')

    browser.end()
