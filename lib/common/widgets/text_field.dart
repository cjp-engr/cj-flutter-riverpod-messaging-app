import 'package:cj_flutter_riverpod_messaging_app/common/constants/border_radius.dart';
import 'package:cj_flutter_riverpod_messaging_app/common/constants/spacing.dart';
import 'package:cj_flutter_riverpod_messaging_app/common/enums/font_size.dart';
import 'package:flutter/material.dart';

class MessageTextField extends StatelessWidget {
  final String label;
  final Widget? prefixIcon;
  final Function(String)? onChanged;
  const MessageTextField({
    super.key,
    required this.label,
    this.onChanged,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        floatingLabelStyle: const TextStyle(color: Colors.grey),
        contentPadding: const EdgeInsets.symmetric(
          vertical: MessageSpacing.verySmall,
          horizontal: MessageSpacing.verySmall,
        ),
        prefixIcon: prefixIcon,
        labelText: label,
        labelStyle: TextStyle(fontSize: MessageFontSize.medium.value),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(MessageBorderRadius.verySmall),
          ),
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(MessageBorderRadius.verySmall),
          ),
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
    );
  }
}
