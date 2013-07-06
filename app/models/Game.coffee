#todo: refactor to have a game beneath the outer blackjack model
class window.Game extends Backbone.Model

  initialize: ->
    self = @
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @get('playerHand').on 'stand', -> self.dealerWins()
    @get('playerHand').on 'bust', -> self.dealerWins(true)

  dealerWins: (busted) ->
    @get('dealerHand').at(0).flip()
    dealerScore = @get('dealerHand').scores()[1] or @get('dealerHand').scores()[0]
    playerScore = if @get('playerHand').scores()[1] <= 21 then @get('playerHand').scores()[1] else @get('playerHand').scores()[0]
    if not busted
      while dealerScore < 17
        @get('dealerHand').hit()
        dealerScore = @get('dealerHand').scores()[1] or @get('dealerHand').scores()[0]
    @set 'dealerWon', busted or (dealerScore >= playerScore and dealerScore <= 21)
    @trigger 'winner', @
    app.trigger 'winner', @
