/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/addFriend.png
  AssetGenImage get addFriend => const AssetGenImage('assets/images/addFriend.png');

  /// File path: assets/images/addFriendButton.png
  AssetGenImage get addFriendButton => const AssetGenImage('assets/images/addFriendButton.png');

  /// File path: assets/images/call.png
  AssetGenImage get call => const AssetGenImage('assets/images/call.png');

  /// File path: assets/images/edit.png
  AssetGenImage get edit => const AssetGenImage('assets/images/edit.png');

  /// File path: assets/images/emptyScreen.png
  AssetGenImage get emptyScreen => const AssetGenImage('assets/images/emptyScreen.png');

  /// File path: assets/images/end.png
  AssetGenImage get end => const AssetGenImage('assets/images/end.png');

  /// File path: assets/images/fillStar.png
  AssetGenImage get fillStar => const AssetGenImage('assets/images/fillStar.png');

  /// File path: assets/images/lock.png
  AssetGenImage get lock => const AssetGenImage('assets/images/lock.png');

  /// File path: assets/images/logout.png
  AssetGenImage get logout => const AssetGenImage('assets/images/logout.png');

  /// File path: assets/images/menu.png
  AssetGenImage get menu => const AssetGenImage('assets/images/menu.png');

  /// File path: assets/images/mute.png
  AssetGenImage get mute => const AssetGenImage('assets/images/mute.png');

  /// File path: assets/images/noFavorites.png
  AssetGenImage get noFavorites => const AssetGenImage('assets/images/noFavorites.png');

  /// File path: assets/images/profile.png
  AssetGenImage get profile => const AssetGenImage('assets/images/profile.png');

  /// File path: assets/images/scan.png
  AssetGenImage get scan => const AssetGenImage('assets/images/scan.png');

  /// File path: assets/images/star.png
  AssetGenImage get star => const AssetGenImage('assets/images/star.png');

  /// File path: assets/images/team.png
  AssetGenImage get team => const AssetGenImage('assets/images/team.png');

  /// File path: assets/images/teamwork.png
  AssetGenImage get teamwork => const AssetGenImage('assets/images/teamwork.png');

  /// File path: assets/images/theme.png
  AssetGenImage get theme => const AssetGenImage('assets/images/theme.png');

  /// File path: assets/images/video.png
  AssetGenImage get video => const AssetGenImage('assets/images/video.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        addFriend,
        addFriendButton,
        call,
        edit,
        emptyScreen,
        end,
        fillStar,
        lock,
        logout,
        menu,
        mute,
        noFavorites,
        profile,
        scan,
        star,
        team,
        teamwork,
        theme,
        video
      ];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
