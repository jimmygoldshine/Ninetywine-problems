var Wines = React.createClass({

  render: function() {
    wines = this.props.wines.map( function(wine) {
      return (
        <Wine wine={wine} key={wine.id} />
      );
    });
    return (
      <div>
        <h1>Wines</h1>
        <div id="wines">
          <table>
            <thead>
              <tr>
                <th>Name</th>
                <th>Sweet</th>
                <th>Herby</th>
                <th>Bitter</th>
                <th>Fruity</th>
                <th>Oaky</th>
                <th>Alcohol</th>
                <th>Acid</th>
              </tr>
            </thead>
            <tbody>
              {wines}
            </tbody>
          </table>
        </div>
      </div>
    );
  }
});
