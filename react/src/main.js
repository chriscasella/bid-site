import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import AuctionList from './components/AuctionList';

$(function() {
  let app = document.getElementById( 'app' );
    if (app) {
    ReactDOM.render(
        <AuctionList />,
        app
      );
    };
  });
