Feature: DELETE usuario

Background:
    * url baseUrl
    * headers headers

Scenario: Eliminar usuario existente
    * def userData = call read('classpath:utils/common.feature')

    Given path 'usuarios'
    And request userData
    When method POST
    Then status 201
    * def userId = response._id

    Given path 'usuarios', userId
    When method DELETE
    Then status 200
    And match response.message == 'Registro excluído com sucesso'

Scenario: Eliminar usuario inexistente
    Given path 'usuarios', 'idNoExiste123'
    When method DELETE
    Then status 200
    And match response.message == 'Nenhum registro excluído'
