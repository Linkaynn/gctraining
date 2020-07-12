import 'dart:io';

import 'package:flutter/material.dart';

class KXImage extends StatelessWidget {
  final dynamic image;

  final double height;
  final double width;

  final BoxFit fit;

  final EdgeInsets margin;

  final Function onTap;

  final bool isCircular;

  KXImage({@required this.image, this.height, this.width, this.fit, this.margin, this.onTap, this.isCircular = false}) {
    assert(this.image is File || this.image is String);
  }

  @override
  Widget build(BuildContext context) {
    Widget widget = _buildImageWidget();

    if (this.isCircular) {
      widget = ClipOval(child: widget);

      if (this.height != this.width) {
        throw ArgumentError('KXImage: width and height are unequal (width:${this.width} != height:${this.height})');
      }
    }

    return Container(
      margin: this.margin,
      child: widget,
    );
  }

  Widget _buildImageWidget() {
    bool isString = image is String;
    if (isString) {
      bool isFromNetwork = image.contains('http://') || image.contains('https://');
      if (isFromNetwork) {
        return Image.network(
          image,
          fit: this.fit != null ? this.fit : this.isCircular ? BoxFit.cover : null,
          height: this.height,
          width: this.width,
        );
      }
      return Image.asset(
        this.image ?? _getDefaultAsset().toString(),
        fit: this.fit != null ? this.fit : this.isCircular ? BoxFit.cover : null,
        height: this.height,
        width: this.width,
      );
    }

    return Image.file(
      image,
      fit: this.fit != null ? this.fit : this.isCircular ? BoxFit.cover : null,
      width: this.width,
      height: this.height,
    );
  }

  static AssetImage _getDefaultAsset() => AssetImage('assets/users/default.png');
}
