const { sassPlugin } = require('esbuild-sass-plugin');

require('esbuild').build({
  entryPoints: ['lib/matestack/ui/bootstrap/index.js'],
  plugins: [sassPlugin()],
  bundle: true,
  outfile: 'dist/matestack-ui-bootstrap.js',
  minify: true,
  external: [
    'matestack-ui-core',
    'vue/dist/vue.esm',
    'bootstrap'
  ],
  format: 'esm'
}).catch(() => process.exit(1))