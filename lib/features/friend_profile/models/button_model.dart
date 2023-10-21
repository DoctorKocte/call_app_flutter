import 'package:call_app/assets/assets.gen.dart';
import 'package:flutter/material.dart';

enum ButtonModel {
  call,
  video,
  favorite,
  redo,
  qr,
  lock;

  Image get image {
    switch (this) {
      case ButtonModel.call:
        return Assets.images.call.image(color: Colors.white);
      case ButtonModel.video:
        return Assets.images.video.image(color: Colors.white);
      case ButtonModel.favorite:
        return Assets.images.fillStar.image(color: Colors.white);
      case ButtonModel.redo:
        return Assets.images.edit.image(color: Colors.white);
      case ButtonModel.qr:
        return Assets.images.scan.image(color: Colors.white);
      case ButtonModel.lock:
        return Assets.images.lock.image(color: Colors.white);
    }
  }
}
