var Wine = React.createClass({
  getInitialState() {
    return {
      wine: this.props.wine
    }
  },

  render() {
    return (
      <tr>
        <td>this.state.wine.name</td>
        <td>this.state.wine.sweet</td>
        <td>this.state.wine.herby</td>
        <td>this.state.wine.bitter</td>
        <td>this.state.wine.fruity</td>
        <td>this.state.wine.oaky</td>
        <td>this.state.wine.alcohol</td>
        <td>this.state.wine.acid</td>
      </tr>
    );
  }
});
