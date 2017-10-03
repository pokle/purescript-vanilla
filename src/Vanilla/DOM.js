"use strict";

var Data_Maybe = require('../Data.Maybe')

exports.clog = function(s) {
  return function() {
    console.log(s);
    return {};
  };
};

exports.getElementById = function(s) {
    return function() {
        var r = document.getElementById(s);
        if (r) {
          return Data_Maybe.Just.create(r); 
        } else {
          return Data_Maybe.Nothing.value;
        }
    }
}

exports.setInnerHTML = function(s) {
  return function(d) {
    return function() {
      d.innerHTML = s;
      return {};
    }
  }
}