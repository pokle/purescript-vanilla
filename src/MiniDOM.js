
exports.clog = function(s) {
  return function() {
    console.log('|-<>-| ', s);
    return {};
  };
};

exports.getElementById = function(s) {
    return function() {
        return document.getElementById(s);
    }
}