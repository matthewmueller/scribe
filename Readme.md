# Scribe

Makes [guardian/scribe](https://github.com/guardian/scribe) easily consumable by component.

## Installation

Using component:

    component install matthewmueller/scribe

Or you can use the `dist/` packages which export `window.scribe`:

  * `dist/scribe.js`: 144kb
  * `dist/scribe.min.js`: 40kb

## Building scribe from scratch

    make clean
    make install
    make

## Updating scribe

The goal of this project is to make it easy to keep up with upstream changes. To update the version, simply update the github release url in the Makefile:

https://github.com/MatthewMueller/scribe/blob/master/Makefile#L9
