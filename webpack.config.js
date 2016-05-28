
var path              = require( 'path' );
var webpack           = require( 'webpack' );
var merge             = require( 'webpack-merge' );
var HtmlWebpackPlugin = require( 'html-webpack-plugin' );
var autoprefixer      = require( 'autoprefixer' );
var ExtractTextPlugin = require( 'extract-text-webpack-plugin' );
var WebpackNotifierPlugin = require('webpack-notifier');
var CleanWebpackPlugin = require('clean-webpack-plugin');

// detemine build env
var TARGET_ENV = process.env.npm_lifecycle_event === 'build' ? 'production' : 'development';
// common webpack config
var commonConfig = {
  target: 'web',

  output: {
    path:       path.resolve( __dirname, 'dist/' ),
    filename: 'bundle.[hash].js',
  },

  resolve: {
    modulesDirectories: ['node_modules'],
    extensions:         ['', '.js', '.elm']
  },

  module: {
    loaders: [
      {
        test: /\.(eot|ttf|woff|woff2|svg)$/,
        loader: 'file-loader'
      }
    ]
  },

  plugins: [
    new CleanWebpackPlugin(['dist', 'build']  ),
    new WebpackNotifierPlugin({
      title: 'Webpack'
    }),
    new HtmlWebpackPlugin({
      template: 'src/index.html',
      inject:   'body',
      filename: 'index.html'
    }),
    new ExtractTextPlugin('theme.css')
  ],

  postcss: [ autoprefixer( { browsers: ['last 2 versions'] } ) ],

}

// additional webpack settings for local env (when invoked by 'npm start')
if ( TARGET_ENV === 'development' ) {
  module.exports = merge( commonConfig, {

    entry: [
      'webpack-dev-server/client?http://localhost:8080',
      path.join( __dirname, 'src/index.js' )
    ],

    devServer: {
      inline:   true,
      progress: true
    },

    module: {
      loaders: [
        {
          test:    /Main\.elm$/,
          exclude: [/elm-stuff/, /node_modules/, /Stylesheets\.elm/],
          loader:  'elm-hot!elm-webpack?verbose=true&warn=true'
        },
        {
          test: /Stylesheets\.elm/,
          exclude: [/elm-stuff/, /node_modules/, /Main\.elm/],
          loader: 'style!css!elm-css-webpack'
        },
        {
          test: /\.(css|scss)$/,
          loaders:['style-loader', 'css-loader','postcss-loader','sass-loader']
        },
      ]
    }

  });
}
