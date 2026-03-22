Feature: PUT actualizar usuario

Background:
    * url baseUrl
    * headers headers
    * def DataGenerator = Java.type('helpers.DataGenerator')

Scenario: Actualizar usuario existente
    * def userData = call read('classpath:utils/common.feature')

    Given path 'usuarios'
    And request userData
    When method POST
    Then status 201
    * def userId = response._id

    * def updateBody =
    """
    {
      "nome": "Usuario Actualizado",
      "email": "#(DataGenerator.randomEmail())",
      "password": "NuevaClave123",
      "administrador": "false"
    }
    """

    Given path 'usuarios', userId
    And request updateBody
    When method PUT
    Then status 200
    And match response.message == 'Registro alterado com sucesso'

Scenario: Actualizar usuario con ID inexistente crea nuevo registro
    * def updateBody =
    """
    {
      "nome": "Usuario Nuevo PUT",
      "email": "#(DataGenerator.randomEmail())",
      "password": "Password123",
      "administrador": "true"
    }
    """

    Given path 'usuarios', 'idNoExiste123'
    And request updateBody
    When method PUT
    Then status 201
    And match response.message == 'Cadastro realizado com sucesso'
    And match response._id == '#string'
