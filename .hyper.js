module.exports = {
  config: {
    frame: false,
    minimizable: false,
    maximizable: false,
    closable:false,
    titleBarStyle: 'customButtonsOnHover',
    updateChannel: 'stable',
    fontSize: 12,
    fontFamily: ' "Victor Mono", Hack Nerd Font',
    fontWeight: 'normal',
    borderColor: '#706859',
    fontWeightBold: 'bold',
    lineHeight: 1,
    letterSpacing: 0,
    cursorColor: '<span class="comment">#7294c2</span>',
    cursorShape: 'BLOCK',
    cursorBlink: true,
    foregroundColor: '#706859',
    backgroundColor: '#000',
    selectionColor: '##706859',
    css: '',
    termCSS: '',
    padding: '7px',
    showHamburgerMenu: '',
    showWindowControls: '',
    shell: '',
    shellArgs: ['--login'],
    bell: 'SOUND',
    copyOnSelect: false,
    defaultSSHApp: true,
    quickEdit: false,
    macOptionSelectionMode: 'vertical',
    webGLRenderer: true,
    hyperBorder: {
      borderColors: ['black', 'black'],
      borderWidth: '2px',
    },
    gruvboxTheme: {
      style: 'dark', // or 'light'
      contrast: 'hard' // or 'soft', 'hard'
    },
    env: {
      LANG: "ja_JP.UTF-8",
      LC_ALL: "ja_JP.UTF-8"
    },
  },
  plugins: [
    "hyper",
    "hyperminimal",
    "hypercwd",
    "hyperborder",
    "hyperemoji",
    "hyper-gruvbox",
  ],
  localPlugins: [],
  keymaps: {},
}
