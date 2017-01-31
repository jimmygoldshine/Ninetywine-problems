@Wine = React.createClass
  render: ->
    React.DOM.tr null,
      React.DOM.td null, @props.wine.name
      React.DOM.td null, @props.wine.sweet
      React.DOM.td null, @props.wine.herby
      React.DOM.td null, @props.wine.bitter
      React.DOM.td null, @props.wine.fruity
      React.DOM.td null, @props.wine.oaky
      React.DOM.td null, @props.wine.alcohol
      React.DOM.td null, @props.wine.acid
