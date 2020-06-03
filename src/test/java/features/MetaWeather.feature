@meta_weather

Feature: MetaWeather API tests

  Background: setup base URL
    * url 'https://www.metaweather.com/api'

  Scenario: Search for London
    Given path '/location/search'
    And param query = 'London'
    When method get
    Then status 200