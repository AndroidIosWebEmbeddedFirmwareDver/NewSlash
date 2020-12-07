import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CopyableText extends StatelessWidget {
  final String data;
  final TextStyle style;
  final TextAlign textAlign;
  final TextDirection textDirection;
  final bool softWrap;
  final TextOverflow overflow;
  final double textScaleFactor;
  final int maxLines;
  CopyableText(
    this.data, {
    required this.style,
    required this.textAlign,
    required this.textDirection,
    required this.softWrap,
    required this.overflow,
    required this.textScaleFactor,
    required this.maxLines,
  });
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      child: new Text(data,
          style: style,
          textAlign: textAlign,
          textDirection: textDirection,
          softWrap: softWrap,
          overflow: overflow,
          textScaleFactor: textScaleFactor,
          maxLines: maxLines),
      onLongPress: () {
        Clipboard.setData(new ClipboardData(text: data));
      },
    );
  }
}
