Feature: POST usuarios

Background:
    * url baseUrl
    * headers headers

Scenario: Registrar usuario válido
    * def commonData = call read('classpath:utils/common.feature')
    * def userData = commonData.requestBody
    Given path 'usuarios'
    And request userData
    When method POST
    Then status 201
    And match response.message == 'Cadastro realizado com sucesso'
    And match response._id == '#string'

Scenario: No registrar usuario con email duplicado
    * def commonData = call read('classpath:utils/common.feature')
    * def duplicatedUser = commonData.requestBody

    Given path 'usuarios'
    And request duplicatedUser
    When method POST
    Then status 201
    And match response._id == '#string'

    Given path 'usuarios'
    And request duplicatedUser
    When method POST
    Then status 400
    And match response == read('classpath:schemas/error-schema.json')
    And match response.message == 'Este email já está sendo usado'

Scenario: No registrar usuario con body inválido
    Given path 'usuarios'
    And request
    """
    {
      "nome": "",
      "email": "correo-invalido",
      "password": "",
      "administrador": "true"
    }
    """
    When method POST
    Then status 400
    And match response.email == 'email deve ser um email válido'
