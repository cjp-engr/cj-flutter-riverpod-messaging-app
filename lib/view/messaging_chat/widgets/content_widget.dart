import 'package:cj_flutter_riverpod_messaging_app/common/constants/circle_avatar_size.dart';
import 'package:cj_flutter_riverpod_messaging_app/common/constants/spacing.dart';
import 'package:cj_flutter_riverpod_messaging_app/common/utils/icon_res.dart';
import 'package:cj_flutter_riverpod_messaging_app/common/widgets/circle_avatar.dart';
import 'package:flutter/material.dart';

class ContentWidget extends StatelessWidget {
  const ContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _sender(),
        _receiver(),
      ],
    );
  }

  Widget _sender() {
    return Row(
      children: [
        Container(width: 400, height: 50, color: Colors.blue),
        const SizedBox(width: MessageSpacing.extraSmall),
        const MessageCircleAvatar(
            image: IconRes.testOnly, radius: MessageCircleAvatarSize.small)
      ],
    );
  }

  Widget _receiver() {
    return Row(
      children: [
        const MessageCircleAvatar(
            image: IconRes.testOnly, radius: MessageCircleAvatarSize.small),
        const SizedBox(width: MessageSpacing.extraSmall),
        Container(width: 400, height: 50, color: Colors.blue),
      ],
    );
  }
}
