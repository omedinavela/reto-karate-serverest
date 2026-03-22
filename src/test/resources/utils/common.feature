Feature: Common reusable steps

Scenario: Create random user
    * def DataGenerator = Java.type('helpers.DataGenerator')
    * def requestBody =
    """
    {
      "nome": "#(DataGenerator.randomName())",
      "email": "#(DataGenerator.randomEmail())",
      "password": "#(DataGenerator.randomPassword())",
      "administrador": "true"
    }
    """
