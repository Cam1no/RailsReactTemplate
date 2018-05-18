import React from 'react';
import ReactDOM from 'react-dom';
import { createStore, applyMiddleware, compose } from 'redux';
import thunk from 'redux-thunk';
import { Provider } from 'react-redux';

import DevTools from '../src/DevTools';
import reducer from '../src/app/reducer';

import { BrowserRouter } from 'react-router-dom';
import App from '../src/app';

const { ENVIRONMENT } = process.env;

let enhancer;

if (ENVIRONMENT === 'development') {
  enhancer = compose(
    applyMiddleware(thunk),
    DevTools.instrument({
      maxAge: 20,
      shouldCatchErrors: true,
    }),
  );
} else {
  enhancer = compose(applyMiddleware(thunk));
}

const store = createStore(reducer, enhancer);

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <Provider store={store}>
      <span>
        <BrowserRouter>
          <App />
        </BrowserRouter>
        {ENVIRONMENT === 'development' ? <DevTools /> : null}
      </span>
    </Provider>,
    document.body.appendChild(document.createElement('div')),
  );
});
