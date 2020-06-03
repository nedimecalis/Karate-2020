@meta_weather

Feature: MetaWeather API tests

  Background: setup base URL
    * url 'https://www.metaweather.com/api'

  Scenario: Search for London
    Given path '/location/search'
    And param query = 'London'
    When method get
    Then status 200
    And match response[0] contains {title: 'London'}
    And match each response contains {title: 'London'}


  Scenario Outline: Verify that city <query> exist
    Given path '/location/search'
    And param query = '<query>'
    When method get
    Then status 200
    And match each response contains {title: '<query>'}
    * print karate.pretty(response)

    Examples: cities
      | query       |
      | New York    |
      | London      |
      | Los Angeles |