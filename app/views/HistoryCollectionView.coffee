class window.HistoryCollectionView extends Backbone.View

  tagName: 'div class="historyCollection"'

  initialize: ->
    @render()

  render: ->
    @$el.children().detach()
    @$el.html('').append(@collection).map (history) ->
      return new HistoryView(model: history).render().el
