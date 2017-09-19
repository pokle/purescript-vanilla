exports.clog = function(s) {
  return function() {
    console.log('|--| ', s);
    return {};
  };
};
