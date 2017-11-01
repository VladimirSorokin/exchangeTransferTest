Feature: Transfer between accounts
  Scenario: Transfer from USD to BTC
    Then Transfer from "USD" account to "BTC" account. Amount "100"

  Scenario: Transfer from BTC to USD
    Then Transfer from "BTC" account to "USD" account. Amount "0.001"
#
#  Scenario: Transfer from EUR to GBP
#    Then Transfer from "EUR" account to "GBP" account. Amount "100"