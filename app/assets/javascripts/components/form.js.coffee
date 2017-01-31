class Form extend React.Component {
  constructor(props) {
    super(props);
    this.state = {value: 'hello'};
  }

  render() {
    return (
    <form>
    <label>
      Name:
      <input type="text" value ="Placeholder"/>
      </label>
      <input type="submit" value="Submit" />
      </form>
      );
  }
};
