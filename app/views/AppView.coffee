class window.AppView extends Backbone.View

  template: _.template '
    <div class="currentGame"></div>
    <div class="history"></div>
  '

  initialize: ->
    @model.set 'currentGame', new Game()
    @model.set 'historyCollection', new HistoryCollection()
    @render()


  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.currentGame').html new GameView(model: @model.get('currentGame')).el
    @$('.history').html new HistoryCollectionView(collection: new HistoryCollection()).el
