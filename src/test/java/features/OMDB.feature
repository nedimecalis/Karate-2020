Feature: OMDB API tests

  Background: setup
    * url 'http://www.omdbapi.com'

  Scenario: Verify that API key is required
    Given param t = 'Home Alone'
    When method get
    Then status 401
    And assert response.Error == 'No API key provided.'
    * print response
        