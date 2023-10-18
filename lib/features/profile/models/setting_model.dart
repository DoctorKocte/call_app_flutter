import 'package:call_app/assets/assets.gen.dart';

enum SettingsTypes {
  edit(title: 'Edit'),
  blocked(title: 'Blocked users'),
  favorites(title: 'Favorites'),
  mute(title: 'Mute for calls'),
  theme(title: 'Change theme'),
  logout(title: 'Logout');

  AssetGenImage get image {
    switch (this) {
      case SettingsTypes.edit:
        return Assets.images.edit;
      case SettingsTypes.blocked:
        return Assets.images.lock;
      case SettingsTypes.favorites:
        return Assets.images.edit;
      case SettingsTypes.mute:
        return Assets.images.edit;
      case SettingsTypes.theme:
        return Assets.images.edit;
      case SettingsTypes.logout:
        return Assets.images.edit;
    }
  }

  const SettingsTypes({required this.title});

  final String title;
}
