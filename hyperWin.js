module.exports = {
  config: {
    // default font size in pixels for all tabs
    fontSize: 12,

    // font family with optional fallbacks
    fontFamily: "PowerlineSymbols, Operator Mono",

    // terminal cursor background color and opacity (hex, rgb, hsl, hsv, hwb or cmyk)
    cursorColor: "#d0d0d1",

    // `BEAM` for |, `UNDERLINE` for _, `BLOCK` for █
    cursorShape: "BLOCK",

    // color of the text
    foregroundColor: "#bbbbbb",

    // terminal background color
    backgroundColor: "#000000",

    // border color (window, tabs)
    borderColor: "#000000",

    // custom css to embed in the main window
    css: "",

    // custom css to embed in the terminal window
    termCSS: "",

    // set to `true` if you're using a Linux set up
    // that doesn't shows native menus
    // default: `false` on Linux, `true` on Windows (ignored on macOS)
    showHamburgerMenu: "",

    // set to `false` if you want to hide the minimize, maximize and close buttons
    // additionally, set to `'left'` if you want them on the left, like in Ubuntu
    // default: `true` on windows and Linux (ignored on macOS)
    showWindowControls: "",

    // custom padding (css format, i.e.: `top right bottom left`)
    padding: "12px 14px",

    // the full list. if you're going to provide the full color palette,
    // including the 6 x 6 color cubes and the grayscale map, just provide
    // an array here instead of a color map object
    // Based on Atom One Dark syntax theme, hyper theme here:
    // https://github.com/mdo/hyperterm-atom-dark/blob/master/index.js
    colors: {
      black: "#000000",
      red: "#e06c75",
      green: "#98c379",
      yellow: "#d19a66",
      blue: "#56b6c2",
      magenta: "#c678dd",
      cyan: "#56b6c2",
      white: "#d0d0d0",
      lightBlack: "#808080",
      lightRed: "#e06c75",
      lightGreen: "#98c379",
      lightYellow: "#d19a66",
      lightBlue: "#56b6c2",
      lightMagenta: "#c678dd",
      lightCyan: "#56b6c2",
      lightWhite: "#ffffff"
    },

    // the shell to run when spawning a new session (i.e. /usr/local/bin/fish)
    // if left empty, your system's login shell will be used by default
    shell: "powershell.exe",

    // for setting shell arguments (i.e. for using interactive shellArgs: ['-i'])
    // by default ['--login'] will be used
    shellArgs: [],

    // for environment variables
    env: {},

    // set to false for no bell
    bell: false,

    // if true, selected text will automatically be copied to the clipboard
    copyOnSelect: false

    // URL to custom bell
    // bellSoundURL: 'http://example.com/bell.mp3',

    // for advanced config flags please refer to https://hyper.is/#cfg
  },

  // a list of plugins to fetch and install from npm
  // format: [@org/]project[#version]
  // examples:
  //   `hyperpower`
  //   `@company/project`
  //   `project#1.0.1`
  plugins: [
    "hyper-blink",
    "hyperterm-cursor",
    "hypercwd",
    "hyperlinks",
    "hyperclean"
  ],

  hyperclean: {
    hideTabs: true
  },

  // in development, you can create a directory under
  // `~/.hyper_plugins/local/` and include it here
  // to load it and avoid it being `npm install`ed
  localPlugins: []
};
