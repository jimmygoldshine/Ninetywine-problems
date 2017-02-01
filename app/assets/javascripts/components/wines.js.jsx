var Wines = React.createClass({
  render: function() {
    wines = this.state.wines.map (function(wine) {
      return (
        <Wine wine={wine} key={wine.id} />
      );
    }
  }
});
