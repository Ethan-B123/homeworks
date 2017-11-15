import React from 'react';

import GiphysIndex from './giphys_index';


class GiphySearch extends React.Component {

  constructor(props) {
    super(props);
    this.state = {
      currentSearch: "",
      giphys: []
    };
  }

  update(event) {
    this.setState({currentSearch: event.target.value});
  }

  submit(event) {
    event.preventDefault();
    this.props.fetchSearchGiphys(this.state.currentSearch)
      .then((res) => this.setState({giphys: res.giphys}));
  }

  render() {
    return (
      <div>
        <form>
          <label>Search</label>
          <br />
          <input id="search-input" onChange={this.update.bind(this)} />
          <button onClick={this.submit.bind(this)}>Search</button>
        </form>
        <GiphysIndex giphys={this.state.giphys}/>
      </div>
    );
  }
}

export default GiphySearch;
