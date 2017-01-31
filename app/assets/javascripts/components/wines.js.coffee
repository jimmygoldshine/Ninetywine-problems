function showWine(props) {
  const wineFound = props.wineFound;
  if (wineFound) {


  @Wines = React.createClass
    getInitialState: ->
      wines: @props.data
    getDefaultProps: ->
      wines: []
    render: ->
      React.DOM.div
        className: 'wines'
        React.DOM.h2
          className: 'name'
          'Wine'
        React.DOM.table
          className: 'table table-bordered'
          React.DOM.thead null,
            React.DOM.tr null,
              React.DOM.th null, 'Name'
              React.DOM.th null, 'Sweetness'
              React.DOM.th null, 'Herbiness'
              React.DOM.th null, 'Bitterness'
              React.DOM.th null, 'Fruitiness'
              React.DOM.th null, 'Oakiness'
              React.DOM.th null, 'Alcohol'
              React.DOM.th null, 'Acidity'
          React.DOM.tbody null,
            for wine in wines[wine]
              React.createElement Wine, key: wine.id, wine: wine

  }
  return <GuestGreeting />;
}

ReactDOM.render(
// Try changing to isLoggedIn={true}:
<Greeting isLoggedIn={false} />,
document.getElementById('root')
);
