class window.HistoryView extends Backbone.View

  tagName: 'div class="historyItem"'

  template: _.template '
    <div class="histPlayer"><div class="histDealer"></div>
  '

  render: ->
    @$el.html @template()

