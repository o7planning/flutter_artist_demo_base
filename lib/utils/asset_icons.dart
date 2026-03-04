class AssetIcons {
  static get dashboard => 'dashboard'.png;

  static get login => 'login'.png;

  static get menu => 'menu'.png;

  static get lightMode => 'light_mode'.png;

  static get darkMode => 'dark_mode'.png;

  static get chat => 'chat'.png;

  static get notification => 'notification'.png;

  static get globe => 'dashboard'.png;

  static get debug => 'debug'.png;

  static get errorActive => 'error-active'.png;

  static get errorInactive => 'error-inactive'.png;

  static get error => 'error'.png;
}

extension Png on String {
  String get png => 'static-rs/icons/$this.png';
}
