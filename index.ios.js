/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 */
'use strict';

import React, { Component } from 'react';
import {
  AppRegistry,
} from 'react-native';


var SimpleView = require('./SimpleView');
var PassingData = require('./PassingData');
var ModalWithNavigator = require('./ModalWithNavigator');

// Here we are exposing each component as different `modules` so that we can
// gain access to them and starting points in our RCTRootViews.
AppRegistry.registerComponent('SimpleView', () => SimpleView);
AppRegistry.registerComponent('PassingData', () => PassingData);
AppRegistry.registerComponent('ModalWithNavigator', () => ModalWithNavigator);
