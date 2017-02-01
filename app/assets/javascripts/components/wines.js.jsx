var Wines = React.createClass({

  render: function() {
    {this.state.wines.map(function(wine,i){
      return (
        <Wine key={i}>{wine}</Wine>
      );
    })}
  }
});
