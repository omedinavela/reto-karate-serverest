Feature: GET usuarios

Background:
    * url baseUrl
    * headers headers

Scenario: Listar todos los usuarios correctamente
    Given path 'usuarios'
    When method GET
    Then status 200
    And match response == read('classpath:schemas/users-list-schema.json')
    And match response.quantidade == '#number'
    And match each response.usuarios[*]._id == '#string'
    And match each response.usuarios[*].nome == '#string'
    And match each response.usuarios[*].email == '#string'
