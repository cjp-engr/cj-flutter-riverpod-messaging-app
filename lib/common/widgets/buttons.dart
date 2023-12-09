import 'package:cj_flutter_riverpod_messaging_app/common/enums/button_type.dart';
import 'package:cj_flutter_riverpod_messaging_app/common/utils/build_context_ext.dart';
import 'package:cj_flutter_riverpod_messaging_app/common/utils/icon_res.dart';
import 'package:cj_flutter_riverpod_messaging_app/common/widgets/text.dart';
import 'package:flutter/material.dart';

class MessageButton extends StatelessWidget {
  final MessageButtonType buttonType;
  final String? text;
  final String? assetName;
  final Function()? onPressed;
  final double? width;
  final double? height;
  const MessageButton({
    super.key,
    required this.buttonType,
    this.text,
    this.assetName,
    this.onPressed,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    switch (buttonType) {
      case MessageButtonType.primary:
        return _PrimaryButton(
          text: text!,
          onPressed: onPressed,
          width: width,
          height: height,
        );
      case MessageButtonType.secondary:
        return _SecondaryButton(
          text: text!,
          onPressed: onPressed,
          width: width,
          height: height,
        );
      case MessageButtonType.icon:
        return _IconButton(
          assetName: assetName ?? IconRes.home,
          onPressed: onPressed,
        );

      default:
        return const Placeholder();
    }
  }
}

class _IconButton extends StatelessWidget {
  final String assetName;
  final Function()? onPressed;
  const _IconButton({
    required this.assetName,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        minimumSize: Size.zero,
        padding: EdgeInsets.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        alignment: Alignment.centerLeft,
        splashFactory: NoSplash.splashFactory,
      ).copyWith(overlayColor: MaterialStateProperty.all(Colors.transparent)),
      child: Image.asset(
        assetName,
        scale: 2.7,
        color: Colors.white,
      ),
    );
  }
}

class _PrimaryButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final double? width;
  final double? height;
  const _PrimaryButton({
    required this.text,
    this.onPressed,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 120,
      height: height ?? context.screenHeight * 0.055,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey.shade800,
          minimumSize: Size.zero,
          padding: const EdgeInsets.symmetric(vertical: 10),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        child: MessageText(
          text: text,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _SecondaryButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final double? width;
  final double? height;
  const _SecondaryButton({
    required this.text,
    this.onPressed,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 120,
      height: height ?? context.screenHeight * 0.055,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          minimumSize: Size.zero,
          padding: const EdgeInsets.symmetric(vertical: 10),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        child: MessageText(
          text: text,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
