function emitWarning() {
    if (!emitWarning.warned) {
      emitWarning.warned = true;
      console.log(
        'Deprecation (warning): Using file extension in specifier is deprecated, use "highlight.js/lib/languages/php-template" instead of "highlight.js/lib/languages/php-template.js"'
      );
    }
  }
  emitWarning();
    export default require('./php-template.js');