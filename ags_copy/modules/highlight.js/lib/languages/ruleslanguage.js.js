function emitWarning() {
    if (!emitWarning.warned) {
      emitWarning.warned = true;
      console.log(
        'Deprecation (warning): Using file extension in specifier is deprecated, use "highlight.js/lib/languages/ruleslanguage" instead of "highlight.js/lib/languages/ruleslanguage.js"'
      );
    }
  }
  emitWarning();
    export default require('./ruleslanguage.js');