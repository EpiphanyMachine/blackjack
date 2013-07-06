class window.CardView extends Backbone.View

  className: 'card'

  template: _.template '<div class="cardView card-<%= rankName %>-<%= suitName %>"></>'

  initialize: ->
    @model.on 'change', => @render
    @render()

  render: ->
    @$el.children().detach().end().html
    @$el.html @template @model.attributes
    @$el.find('.cardView').removeClass().addClass 'cardView' unless @model.get 'revealed'
