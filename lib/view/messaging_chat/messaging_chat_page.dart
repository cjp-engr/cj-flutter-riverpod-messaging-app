import 'package:cj_flutter_riverpod_messaging_app/common/utils/build_context_ext.dart';
import 'package:cj_flutter_riverpod_messaging_app/common/widgets/app_bar.dart';
import 'package:cj_flutter_riverpod_messaging_app/view/messaging_chat/widgets/content_widget.dart';
import 'package:cj_flutter_riverpod_messaging_app/view/messaging_chat/widgets/status_details_widget.dart';
import 'package:flutter/material.dart';

class MessagingChatPage extends StatelessWidget {
  final String id;
  const MessagingChatPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return MessageAppBar(
      appBarTitle: const StatusDetailsWidget(),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.padding),
          child: const ContentWidget()),
    );
  }
}
