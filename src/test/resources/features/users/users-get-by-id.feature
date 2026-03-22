Feature: GET usuario por ID

Background:
    * url baseUrl
    * headers headers

Scenario: Buscar usuario existente por ID
    * def userData = call read('classpath:utils/common.feature')

    Given path 'usuarios'
    And request userData
    When method POST
    Then status 201
    * def userId = response._id

    Given path 'usuarios', userId
    When method GET
    Then status 200
    And match response == read('classpath:schemas/user-response-schema.json')
    And match response._id == userId
    And match response.email == userData.email

Scenario: Buscar usuario con ID inexistente
    Given path 'usuarios', 'idNoExiste123'
    When method GET
    Then status 400
    And match response == read('classpath:schemas/error-schema.json')
