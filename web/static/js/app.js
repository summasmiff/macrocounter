import 'babel-polyfill';
import 'core-js';
import React from 'react'
import ReactDOM from 'react-dom'
import { Router, IndexRoute, Route, Link, browserHistory, Redirect } from 'react-router';
import update from 'immutability-helper';
import EntryForm from './entryForm';
import EntriesTable from './entriesTable';
import Ajax from './ajax'

export class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      loading: true,
      entries: []
    };

    this.updateEntries = this.updateEntries.bind(this);
  }

  async componentDidMount() {
    const entries = await Ajax.get('/api/entries');
    this.setState({entries: entries.data});
  }

  async updateEntries(entry) {
    const newEntry = await Ajax.post('/api/entries', {entry: entry});
    this.setState({entries: update(this.state.entries, {$push: [entry]})});
  }

  render() {
    return (
      <div>
        <h1 className="title">MacroCounter</h1>
        <h4>Macros Remaining Today</h4>
        <table>
          <tbody>
            <tr>
              <th>Protein</th>
              <th>Fat</th>
              <th>Carbs</th>
              <th>Fiber</th>
            </tr>
            <tr>
              <th>110</th>
              <th>53</th>
              <th>107</th>
              <th>25</th>
            </tr>
          </tbody>
        </table>

        <EntryForm updateEntries={this.updateEntries} />
        <EntriesTable entries={this.state.entries} />

        <h4>Add recent</h4>
        <ul>
          <li><button>Coffee</button></li>
          <li><button>Greek yogurt 0%</button></li>
          <li><button>Cottage Cheese</button></li>
        </ul>
      </div>
    );
  }
}

export class HomeContainer extends React.Component {
  render() {
    return <Dashboard />;
  }
}

export function render(element) {
  ReactDOM.render((
    <Router history={browserHistory}>
      <Route path="/" component={App}>
        <IndexRoute component={HomeContainer}/>
      </Route>
    </Router>
  ), element);
}
