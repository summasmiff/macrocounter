import React from 'react'
import PropTypes from 'prop-types'
import Ajax from './ajax'

export default class EntriesTable extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      entries: []
    };
  }

  async componentDidMount() {
    const entries = await Ajax.get('/api/entries');
    this.setState({entries: entries.data});
  }

  render() {
    if(!this.state.entries.length) {return null;}
    return(
      <table>
          <thead>
            <tr>
              <th>&nbsp;</th>
              <th>Protein</th>
              <th>Fat</th>
              <th>Carbs</th>
              <th>Fiber</th>
            </tr>
          </thead>
          <tbody>
            {this.state.entries.map(entry => {
              return(
                <tr key={entry.id}>
                  <td>{entry.name}</td>
                  <td>{entry.grams_protein}</td>
                  <td>{entry.grams_fat}</td>
                  <td>{entry.grams_carbs}</td>
                  <td>{entry.grams_fiber}</td>
                </tr>
              );
            })}
          </tbody>
        </table>
    );
  }
}
