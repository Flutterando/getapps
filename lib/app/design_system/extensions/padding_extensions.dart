import 'package:flutter/material.dart';

extension PaddingNumber on double {
  EdgeInsets get paddingAll => EdgeInsets.all(this);

  EdgeInsets get paddingHorizontal => EdgeInsets.symmetric(horizontal: this);

  EdgeInsets get paddingVertical => EdgeInsets.symmetric(vertical: this);

  EdgeInsets get paddingRight => EdgeInsets.only(right: this);

  EdgeInsets get paddingLeft => EdgeInsets.only(left: this);

  EdgeInsets get paddingTop => EdgeInsets.only(top: this);

  EdgeInsets get paddingBottom => EdgeInsets.only(bottom: this);
}
