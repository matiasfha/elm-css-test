// require('normalize.css');

//load components scss
// var req = require.context('./Components', true, /\.scss$/);
// req.keys().forEach(function(key){
//   req(key);
// });

require('./Stylesheets.elm');
var Elm = require('./Main');
Elm.Main.fullscreen();
