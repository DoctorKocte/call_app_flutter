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
        return Assets.images.call.image();
      case ButtonModel.video:
        return Assets.images.call.image();
      case ButtonModel.favorite:
        return Assets.images.call.image();
      case ButtonModel.redo:
        return Assets.images.call.image();
      case ButtonModel.qr:
        return Assets.images.call.image();
      case ButtonModel.lock:
        return Assets.images.lock.image();
    }
  }
}
