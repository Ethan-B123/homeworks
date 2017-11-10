import React from 'react';

class Calculator extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      num1: "",
      num2: "",
      result: 0
    }
  }

  // your code here
  mult(e){
    e.preventDefault();
    const { num1, num2 } = this.state;
    const result = num1 * num2;
    this.setState({ result });
  }
  div(e){
    e.preventDefault();
    const { num1, num2 } = this.state;
    const result = num1 / num2;
    this.setState({ result });
  }
  add(e){
    e.preventDefault();
    const { num1, num2 } = this.state;
    const result = num1 + num2;
    this.setState({ result });
  }
  sub(e){
    e.preventDefault();
    const { num1, num2 } = this.state;
    const result = num1 - num2;
    this.setState({ result });
  }
  mod(e){
    e.preventDefault();
    const { num1, num2 } = this.state;
    const result = num1 % num2;
    this.setState({ result });
  }

  setNum1(e){
    e.preventDefault();
    const num1 = e.target.value ? parseInt(e.target.value) : "";
    this.setState({ num1 });
  }

  setNum2(e){
    e.preventDefault();
    const num2 = e.target.value ? parseInt(e.target.value) : "";
    this.setState({ num2 });
  }

  clear(e) {
    e.preventDefault();
    this.setState({
      num1: "",
      num2: "",
      result: 0
    });
  }

  render() {
    return (
      <div>
        <h1>{this.state.result}</h1>
        <input type="text" onChange={this.setNum1.bind(this)} value={this.state.num1} />
        <input type="text" onChange={this.setNum2.bind(this)} value={this.state.num2} />
        <br />
        <button onClick={this.mult.bind(this)}>*</button>
        <button onClick={this.div.bind(this)}>/</button>
        <button onClick={this.add.bind(this)}>+</button>
        <button onClick={this.sub.bind(this)}>-</button>
        <button onClick={this.mod.bind(this)}>%</button>
        <br />
        <button onClick={this.clear.bind(this)}>Clear</button>
      </div>
    );
  }
}

export default Calculator;
