import 'package:cj_flutter_riverpod_messaging_app/common/enums/font_size.dart';
import 'package:flutter/material.dart';

class MessageText extends StatelessWidget {
  final String text;
  final MessageFontSize fontSize;
  final FontWeight fontWeight;
  final Color? color;
  final int? maxLines;
  final TextAlign? textAlign;
  const MessageText({
    super.key,
    required this.text,
    this.fontSize = MessageFontSize.medium,
    this.fontWeight = FontWeight.normal,
    this.color,
    this.maxLines,
    this.textAlign = TextAlign.center,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize.value,
        fontWeight: fontWeight,
        color: color,
      ),
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}
