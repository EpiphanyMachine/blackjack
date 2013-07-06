class window.App extends Backbone.Model

  initialize: ->
    @on 'winner', ->
      playerCards = []
      dealerCards = []
      i = 0
      while i < @get('currentGame').get('playerHand').length
        playerCards.push(app.get('currentGame').get('playerHand').at(i).get('rankName')+'-'+app.get('currentGame').get('playerHand').at(i).get('suitName'))
        i++
      i = 0
      while i < @get('currentGame').get('dealerHand').length
        dealerCards.push(app.get('currentGame').get('dealerHand').at(i).get('rankName')+'-'+app.get('currentGame').get('dealerHand').at(i).get('suitName'))
        i++
      console.log(playerCards, dealerCards)