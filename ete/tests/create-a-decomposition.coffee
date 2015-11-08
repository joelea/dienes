assertNumberOfElements = (browser, selector, count) ->
  browser.elements 'css selector', selector, (result) ->
    browser.assert.equal(result.value.length, count);

module.exports =
'add a decomposition' : (browser) ->
    browser
    .url('http://dienes')
    .waitForElementVisible('.ete-set-number')
    .setValue('.ete-set-number', '321')

    assertNumberOfElements(browser, '.hundreds', 3)
    assertNumberOfElements(browser, '.tens', 2)
    assertNumberOfElements(browser, '.ones', 1)

    browser.end()
