'use strict';


import React, { Component } from 'react';
import {
  View,
  Text,
  NavigatorIOS,
  NativeModules,
  StyleSheet,
} from 'react-native';


var SimpleList = require('./SimpleList');
var SimpleView = require('./SimpleView');
var ModalWithNavigatorCoordinator = NativeModules.ModalWithNavigatorCoordinator;

var data = [
    'One',
    'Two',
    'Three',
]

class ModalWithNavigator extends Component{
    _handleButton() {
        ModalWithNavigatorCoordinator.closeModal();
    }

    _handleRowPress() {
        this.refs.navigator.push({
            title: 'Simple View',
            component: SimpleView,
        });
    }

    render() {
        return (
            <NavigatorIOS
                ref="navigator"
                style={styles.container}
                initialRoute={{
                    title: 'Modal with Navigator',
                    component: SimpleList,
                    passProps: {
                        data: data,
                        rowPressed: this._handleRowPress.bind(this)
                    },
                    leftButtonTitle: 'Close',
                    onLeftButtonPress: this._handleButton.bind(this),
                }}
            />
        );
    }
};

var styles = StyleSheet.create({
    container: {
        flex: 1,
    }
});

module.exports = ModalWithNavigator;
