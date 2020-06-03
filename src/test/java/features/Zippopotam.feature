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
    * print karate.pretty(response)
#     here we use JsonPath, same as in RestAssured to get values from payload
#     response - represents JSON body
#     header - represents header of response

     