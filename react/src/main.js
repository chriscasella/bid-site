import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';

$(function() {
  let app = document.getElementById( 'app' );
    if (app) {
    ReactDOM.render(
        <AuctionList />,
        app
      );
    };
  });
