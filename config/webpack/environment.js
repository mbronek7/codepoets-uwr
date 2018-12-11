const { environment } = require('@rails/webpacker')
const { VueLoaderPlugin } = require('vue-loader')
const vue =  require('./loaders/vue')

const webpack = require('webpack');
environment.plugins.append('Provide', new webpack.ProvidePlugin({
  $: 'jquery',
  jQuery: 'jquery',
  jquery: 'jquery',
  'window.jQuery': 'jquery',
  Popper: ['popper.js', 'default']
}));

environment.plugins.append('VueLoaderPlugin', new VueLoaderPlugin())
environment.loaders.append('vue', vue)
module.exports = environment
