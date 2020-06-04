Feature: Spartan API tests

  Background: setup
    * url 'http://54.196.47.224:8000'
    * header Authorization = call read('basic-auth.js') { username: 'admin', password: 'admin' }


  Scenario: Get all spartans
    Given path '/api/spartans'
    When method get
    Then status 200
    * print karate.pretty(response)


  Scenario: Add new spartan and verify status code
    Given path '/api/spartans'
    * def spartan = 
    """
      {
      "name": "Karate Master",
      "gender": "Male",
      "phone": 234512312412
       }
    """
    And request spartan
    When method post
    Then status 201
    And print karate.pretty(response)