import 'package:cj_flutter_riverpod_messaging_app/common/constants/circle_avatar_size.dart';
import 'package:cj_flutter_riverpod_messaging_app/common/constants/spacing.dart';
import 'package:cj_flutter_riverpod_messaging_app/common/utils/icon_res.dart';
import 'package:cj_flutter_riverpod_messaging_app/common/widgets/circle_avatar.dart';
import 'package:cj_flutter_riverpod_messaging_app/common/widgets/text.dart';
import 'package:flutter/material.dart';

class StatusDetailsWidget extends StatelessWidget {
  const StatusDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        MessageCircleAvatar(
          image: IconRes.testOnly,
          radius: MessageCircleAvatarSize.small,
        ),
        SizedBox(width: MessageSpacing.small),
        Column(
          children: [
            MessageText(
              text: 'Carmen Palsario',
              fontWeight: FontWeight.w900,
            ),
            MessageText(
              text: 'Active yesterday',
              color: Colors.grey,
            ),
          ],
        ),
      ],
    );
  }
}
