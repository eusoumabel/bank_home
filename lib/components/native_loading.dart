import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NativeLoading extends StatelessWidget {
  final bool animating;

  NativeLoading({
    Key key,
    this.animating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS ? _iosLoading() : _androidLoading(context);
  }

  _iosLoading() {
    return Align(
      alignment: Alignment.center,
      child: CupertinoActivityIndicator(
        animating: true,
      ),
    );
  }

  _androidLoading(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: CircularProgressIndicator(
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
