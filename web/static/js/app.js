import 'babel-polyfill';
import 'core-js';
import React from 'react'
import ReactDOM from 'react-dom'
import { Router, IndexRoute, Route, Link, browserHistory, Redirect } from 'react-router';
import EntryForm from './entryForm'
import EntriesTable from './entriesTable'

export class App extends React.Component {
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

        <EntryForm />

        <h4>Add recent</h4>
        <ul>
          <li><button>Coffee</button></li>
          <li><button>Greek yogurt 0%</button></li>
          <li><button>Cottage Cheese</button></li>
        </ul>
        <EntriesTable />
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
