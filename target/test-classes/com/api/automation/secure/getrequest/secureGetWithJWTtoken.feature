Feature: To send the get request with JWT token
  GET https://jobapplicationjwt.herokuapp.com/auth/webapi/all

  Scenario: Send the GET request with JWT token
    * def token = call read('../../getToken.feature') {username: 'emilys', password: 'emilyspass'}
    Given url 'https://dummyjson.com/auth/me'
    And headers {Accept:'application/json',Authorization:'#("Bearer " + token.authToken)'}
    When method get
    Then status 200
    
  Scenario: Send the GET request without JWT token
    Given url 'https://dummyjson.com/auth/me'
    And headers {Accept:'application/json'}
    When method get
    Then status 401
