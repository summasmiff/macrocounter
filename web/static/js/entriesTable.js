import React from 'react'
import PropTypes from 'prop-types'

export default class EntriesTable extends React.Component {
  render() {
    if(!this.props.entries.length) {return null;}
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
            {this.props.entries.map(entry => {
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
