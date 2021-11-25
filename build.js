const { sassPlugin } = require('esbuild-sass-plugin');

require('esbuild').build({
  entryPoints: ['lib/matestack/ui/bootstrap/index.js'],
  plugins: [sassPlugin()],
  bundle: true,
  outfile: 'dist/material-ui-bootstrap.js',
  minify: true,
  format: 'esm'
}).catch(() => process.exit(1))