import 'package:cj_flutter_riverpod_messaging_app/common/constants/spacing.dart';
import 'package:cj_flutter_riverpod_messaging_app/common/enums/button_type.dart';
import 'package:cj_flutter_riverpod_messaging_app/common/utils/build_context_ext.dart';
import 'package:cj_flutter_riverpod_messaging_app/common/utils/icon_res.dart';
import 'package:cj_flutter_riverpod_messaging_app/common/widgets/app_bar.dart';
import 'package:cj_flutter_riverpod_messaging_app/common/widgets/buttons.dart';
import 'package:cj_flutter_riverpod_messaging_app/view/messaging_list/widgets/note_widget.dart';
import 'package:cj_flutter_riverpod_messaging_app/view/messaging_list/widgets/search_widget.dart';
import 'package:cj_flutter_riverpod_messaging_app/view/messaging_list/widgets/users_list_widget.dart';
import 'package:flutter/material.dart';

class MessagingListPage extends StatelessWidget {
  const MessagingListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MessageAppBar(
      appBarActions: [
        MessageButton(
          buttonType: MessageButtonType.icon,
          assetName: IconRes.writeMessage,
          onPressed: () {},
        ),
      ],
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.padding),
          child: TapRegion(
            onTapOutside: (event) => FocusScope.of(context).unfocus(),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SearchWidget(),
                SizedBox(height: MessageSpacing.medium),
                NoteWidget(),
                SizedBox(height: MessageSpacing.medium),
                UsersListWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
