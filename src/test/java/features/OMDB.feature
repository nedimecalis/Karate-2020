Feature: OMDB API tests

  Background: setup
    * url 'http://www.omdbapi.com'

  Scenario: Verify that API key is required
    Given param t = 'Home Alone'
    When method get
    Then status 401
    And assert response.Error == 'No API key provided.'
    * print response
    
  Scenario: Verify movie info
    Given param t = 'Karate'
    And param apiKey = '9f94d4d0'
    When method get
    * print karate.pretty(response)
    Then status 200
    And match response contains {Title: 'Karate'}
