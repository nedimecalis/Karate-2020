@bookit
Feature: Book-it API tests

  Background: setup
    * url 'https://cybertek-reservation-api-qa.herokuapp.com'
    * path '/sign'
    * param email = 'teacherva5@gmail.com'
    * param password = 'maxpayne'
    * method get
    * def token = response.accessToken
    * print "Token: ", token

  Scenario: Get all rooms
    Given path '/api/rooms'
    * header Authorization = token
    When method get
    Then status 200
    * print karate.pretty(response)
