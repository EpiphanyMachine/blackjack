class window.History extends Backbone.Model

  initialize: (playerHand, dealerHand, dealerWon) ->
    @set 'playerHand' playerHand
    @set 'dealerHand' dealerHand
    @set 'dealerWon' dealerWon
