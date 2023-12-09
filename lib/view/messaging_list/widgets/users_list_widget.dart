import 'package:cj_flutter_riverpod_messaging_app/common/constants/spacing.dart';
import 'package:cj_flutter_riverpod_messaging_app/common/routes/route_names.dart';
import 'package:cj_flutter_riverpod_messaging_app/common/utils/icon_res.dart';
import 'package:cj_flutter_riverpod_messaging_app/common/widgets/circle_avatar.dart';
import 'package:cj_flutter_riverpod_messaging_app/common/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UsersListWidget extends StatefulWidget {
  const UsersListWidget({super.key});

  @override
  State<UsersListWidget> createState() => _UsersListWidgetState();
}

class _UsersListWidgetState extends State<UsersListWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildSubHeaders(),
        const SizedBox(height: MessageSpacing.medium),
        _buildDisplayDetails(context),
      ],
    );
  }

  Widget _buildSubHeaders() {
    return Row(
      children: [
        MessageText(text: AppLocalizations.of(context)!.messages),
      ],
    );
  }

  Widget _buildDisplayDetails(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            context.goNamed(
              MessageRouteNames.messagingChat,
              pathParameters: {'id': '1'},
            );
          },
          child: Row(
            children: [
              _userDetails(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _userDetails() {
    return Row(
      children: [
        const MessageCircleAvatar(image: IconRes.testOnly),
        const SizedBox(width: MessageSpacing.small),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MessageText(
              text: 'user_name',
            ),
            MessageText(
              text: AppLocalizations.of(context)!.activeTimeAgo('5h'),
              color: Colors.grey,
            ),
          ],
        ),
      ],
    );
  }
}
