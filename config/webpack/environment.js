const { environment } = require('@rails/webpacker')


// The mapbox-gl-js bundle (which is already transpiled) is being transpiled again
// in the current configuration configuration. This line excludes it from transpilation.
environment.loaders.delete('nodeModules')

module.exports = environment
