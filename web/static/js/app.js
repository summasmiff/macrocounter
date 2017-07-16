import React from 'react'
import ReactDOM from 'react-dom'
import { Router, IndexRoute, Route, Link, browserHistory, Redirect } from 'react-router';

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
        <form id="entry">
          <label htmlFor="food">Add food</label>
          <input id="food" type="text" form="entry"></input>
          <label htmlFor="protein">Protein</label>
          <input id="protein" type="text" form="entry"></input>
          <label htmlFor="fat">Fat</label>
          <input id="fat" type="text" form="entry"></input>
          <label htmlFor="carbs">Carbs</label>
          <input id="carbs" type="text" form="entry"></input>
          <input type="submit" value="Save"></input>
        </form>
        <h4>Add recent</h4>
        <ul>
          <li><button>Coffee</button></li>
          <li><button>Greek yogurt 0%</button></li>
          <li><button>Cottage Cheese</button></li>
        </ul>
        <table>
          <tbody>
            <tr>
              <th>&nbsp;</th>
              <th>Protein</th>
              <th>Fat</th>
              <th>Carbs</th>
              <th>Fiber</th>
            </tr>
            <tr>
              <td>Yogurt</td>
              <td>22</td>
              <td>0</td>
              <td>9</td>
              <td>0</td>
            </tr>
            <tr>
              <td>Fruit</td>
              <td>1</td>
              <td>0</td>
              <td>27</td>
              <td>3</td>
            </tr>
            <tr>
              <td>Omelette</td>
              <td>12</td>
              <td>10</td>
              <td>0</td>
              <td>0</td>
            </tr>
            <tr>
              <td>Cheese</td>
              <td>9</td>
              <td>10</td>
              <td>0</td>
              <td>0</td>
            </tr>
            <tr>
              <td>Protein scoop</td>
              <td>24</td>
              <td>1</td>
              <td>3</td>
              <td>0</td>
            </tr>
          </tbody>
        </table>
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
