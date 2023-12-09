import 'package:cj_flutter_riverpod_messaging_app/common/utils/build_context_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';

// ignore: must_be_immutable
class MessageAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? appBarLeading;
  final Widget? appBarTitle;
  List<Widget>? appBarActions;
  final Widget? body;
  MessageAppBar({
    super.key,
    this.appBarLeading,
    this.appBarTitle,
    this.appBarActions,
    this.body,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: appBarLeading,
          title: appBarTitle,
          actions: [...appBarActions ?? [], SizedBox(width: context.padding)],
        ),
        body: AdaptiveLayout(
          body: SlotLayout(
            config: <Breakpoint, SlotLayoutConfig>{
              Breakpoints.small: SlotLayout.from(
                key: const Key('smallBody'),
                builder: (_) => SingleChildScrollView(child: body!),
              ),
              Breakpoints.mediumAndUp: SlotLayout.from(
                key: const Key('mediumAndUpBody'),
                builder: (_) => SingleChildScrollView(child: body!),
              ),
            },
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
