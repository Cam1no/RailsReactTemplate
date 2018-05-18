import React, { Component } from 'react';
import { Switch, Route, Redirect } from 'react-router-dom';

export const HellWorld = () => {
  return (
    <div>
      HelloWorld
    </div>
  )
}

class App extends Component {
  constructor(props) {
    super(props);
  }


  render() {
    return (
      <div className="app-container">
        <Switch>
          <Route path="/" component={HellWorld} />
        </Switch>
      </div>
    );
  }
}

export default App;
