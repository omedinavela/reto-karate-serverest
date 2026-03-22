Feature: Flujo E2E usuarios

Background:
    * url baseUrl
    * headers headers
    * def DataGenerator = Java.type('helpers.DataGenerator')

Scenario: Crear, consultar, actualizar y eliminar usuario
    * def userData = call read('classpath:utils/common.feature')

    Given path 'usuarios'
    And request userData
    When method POST
    Then status 201
    And match response.message == 'Cadastro realizado com sucesso'
    * def userId = response._id

    Given path 'usuarios', userId
    When method GET
    Then status 200
    And match response.email == userData.email

    * def updateBody =
    """
    {
      "nome": "Usuario Modificado",
      "email": "#(DataGenerator.randomEmail())",
      "password": "Password456",
      "administrador": "true"
    }
    """

    Given path 'usuarios', userId
    And request updateBody
    When method PUT
    Then status 200
    And match response.message == 'Registro alterado com sucesso'

    Given path 'usuarios', userId
    When method DELETE
    Then status 200
    And match response.message == 'Registro excluído com sucesso'
