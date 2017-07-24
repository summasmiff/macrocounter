import React from 'react'
import PropTypes from 'prop-types'
import Ajax from './ajax'

export default class EntryForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      name: '',
      grams_protein: 0,
      grams_fat: 0,
      grams_carbs: 0,
      grams_fiber: 0
    };
  }

  submit(e) {
    e.preventDefault();
    const params = {
      'entry': {
        'name': this.state.name,
        'grams_protein': this.state.grams_protein,
        'grams_fat': this.state.grams_fat,
        'grams_carbs': this.state.grams_carbs,
        'grams_fiber': this.state.grams_fiber
      }
    }
    Ajax.post('/api/entries', params);
  }

  render() {
    return(
      <form id="entry" onSubmit={e => this.submit(e)}>
        <label htmlFor="food">Add food</label>
        <input id="food"
               type="text"
               form="entry"
               value={this.state.name}
               onChange={e => this.setState({name: e.target.value})}>
        </input>
        <label htmlFor="protein">Protein</label>
        <input id="protein"
               type="text"
               form="entry"
               value={this.state.grams_protein}
               onChange={e => this.setState({grams_protein: e.target.value})}>
        </input>
        <label htmlFor="fat">Fat</label>
        <input id="fat"
               type="text"
               form="entry"
               value={this.state.grams_fat}
               onChange={e => this.setState({grams_fat: e.target.value})}>
        </input>
        <label htmlFor="carbs">Carbs</label>
        <input id="carbs"
               type="text"
               form="entry"
               value={this.state.grams_carbs}
               onChange={e=>this.setState({grams_carbs: e.target.value})}>
        </input>
        <label htmlFor="fiber">Fiber</label>
        <input id="fiber"
               type="text"
               form="entry"
               value={this.state.grams_fiber}
               onChange={e=>this.setState({grams_fiber: e.target.value})}>
        </input>
        <input type="submit" value="Save"></input>
      </form>
    );
  }
}
