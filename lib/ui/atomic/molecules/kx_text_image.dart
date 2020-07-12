import 'package:flutter/material.dart';
import 'package:gctraining/ui/atomic/atoms/kx_image.dart';
import 'package:gctraining/ui/atomic/atoms/texts/kx_text.dart';

enum KXAxis { horizontal, vertical }

class KXTextImage extends StatelessWidget {
  final String imageURL;

  final KXAxis axis;
  final KXText firstText;
  final KXText secondText;

  final double width;
  final double height;

  final BoxFit fit;

  final EdgeInsets margin;
  final EdgeInsets imageMargin;

  final Function onTap;

  final bool isCircular;

  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;

  KXTextImage(this.imageURL,
      {this.firstText,
      this.secondText,
      this.axis = KXAxis.vertical,
      this.width,
      this.height,
      this.fit,
      this.margin,
      this.imageMargin,
      this.isCircular = false,
      this.mainAxisAlignment,
      this.crossAxisAlignment,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: this.margin,
      child: this._buildWidget(),
    );
  }

  Widget _buildWidget() {
    Widget image = GestureDetector(
      onTap: this.onTap ?? () {},
      child: KXImage(
        image: imageURL,
        margin: this.imageMargin,
        isCircular: this.isCircular,
        width: this.width,
        height: this.height,
        fit: this.fit,
      ),
    );

    if (this.firstText == null && this.secondText == null) {
      return image;
    }

    List<Widget> children = [];

    _addText(children, this.firstText);
    children.add(image);
    _addText(children, this.secondText);

    return this.axis == KXAxis.vertical
        ? Column(
            mainAxisAlignment: this.mainAxisAlignment ?? MainAxisAlignment.start,
            crossAxisAlignment: this.crossAxisAlignment ?? CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: children)
        : Row(
            mainAxisAlignment: this.mainAxisAlignment ?? MainAxisAlignment.start,
            crossAxisAlignment: this.crossAxisAlignment ?? CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: children);
  }

  void _addText(List<Widget> children, Widget text) {
    if (text != null) {
      if (this.axis == KXAxis.vertical) {
        children.add(text);
      } else {
        children.add(text);
      }
    }
  }
}
