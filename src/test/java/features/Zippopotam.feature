Feature: Basic tests for zippopotam

  Background: setup
    * url 'http://api.zippopotam.us'
    * header Accept = 'application/json'

  Scenario: Search for Beverly Hills
    Given path '/us/90210'
    When method get
    Then status 200
    And match header Content-Type == 'application/json'
    And match response.country == 'United States'
    And match response.places[0].['place name'] == 'Beverly Hills'
    And match response.places[0].['state abbreviation'] == 'CA'
    * print karate.pretty(response)
#     here we use JsonPath, same as in RestAssured to get values from payload
#     response - represents JSON body
#     header - represents header of response

  Scenario Outline: Search for <city>
    Given path '/us/<zip_code>'
    When method get
    Then status 200
    And match header Content-Type == 'application/json'
    And match response.country == 'United States'
    And match response.places[0].['place name'] == '<city>'
    And match response.places[0].['state abbreviation'] == '<state_abbreviation>'
    And match response.['post code'] == '<zip_code>'
    And print karate.pretty(response)


    Examples: test data
      | city          | zip_code | state_abbreviation |
      | New York City | 10001    | NY                 |
      | Washington    | 20002    | DC                 |
      | Pompano Beach | 33063    | FL                 |
      | Agawam        | 01001    | MA                 |
     