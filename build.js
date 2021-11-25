const { sassPlugin } = require('esbuild-sass-plugin');

require('esbuild').build({
  entryPoints: ['lib/matestack/ui/bootstrap/index.js'],
  plugins: [sassPlugin()],
  bundle: true,
  outfile: 'dist/material-ui-bootstrap.js',
  minify: false,
  external: [
    'matestack-ui-core',
    'vue/dist/vue.esm',
    'bootstrap'
  ]
}).catch(() => process.exit(1))