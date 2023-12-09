// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cj_flutter_riverpod_messaging_app/common/constants/circle_avatar_size.dart';
import 'package:cj_flutter_riverpod_messaging_app/common/constants/spacing.dart';
import 'package:cj_flutter_riverpod_messaging_app/common/routes/route_names.dart';
import 'package:cj_flutter_riverpod_messaging_app/common/utils/icon_res.dart';
import 'package:cj_flutter_riverpod_messaging_app/common/widgets/circle_avatar.dart';
import 'package:flutter/material.dart';

import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:go_router/go_router.dart';

class MessageNavigationBar extends StatelessWidget {
  final StatefulNavigationShell? navigationShell;
  const MessageNavigationBar({
    Key? key,
    this.navigationShell,
  }) : super(key: key ?? const ValueKey<String>('MessageNavigationBar'));

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
        body: SlotLayout(
          config: <Breakpoint, SlotLayoutConfig>{
            Breakpoints.small: SlotLayout.from(
              key: const Key('smallNavigationShell'),
              builder: (_) => SizedBox(
                child: navigationShell,
              ),
            ),
            Breakpoints.mediumAndUp: SlotLayout.from(
              key: const Key('mediumAndUpNavigationShell'),
              builder: (_) => SizedBox(
                child: navigationShell,
              ),
            ),
          },
        ),
        bottomNavigation: SlotLayout(
          config: <Breakpoint, SlotLayoutConfig>{
            Breakpoints.small: SlotLayout.from(
              key: const Key('smallBottomNavigation'),
              builder: (_) => _buildBottomNavigation(context),
            ),
          },
        ),
        primaryNavigation: SlotLayout(
          config: <Breakpoint, SlotLayoutConfig>{
            Breakpoints.mediumAndUp: SlotLayout.from(
              key: const Key('mediumAndUpNavigationRail'),
              builder: (_) => _buildNavigationRail(context),
            ),
          },
        ));
  }

  Widget _buildBottomNavigation(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: navigationShell!.currentIndex,
      onTap: (index) => _onDestinationSelected(index),
      selectedItemColor: Colors.red,
      unselectedItemColor: Colors.grey,
      items: _bottomNavigationList(context),
      selectedFontSize: 0,
      unselectedFontSize: 0,
      iconSize: 0,
    );
  }

  Widget _buildNavigationRail(BuildContext context) {
    return IntrinsicWidth(
      child: Row(
        children: [
          NavigationRail(
            destinations: _sideNavigationList(context),
            selectedIndex: navigationShell!.currentIndex,
            onDestinationSelected: (int index) => _onDestinationSelected(index),
            labelType: NavigationRailLabelType.all,
            useIndicator: false,
            leading: Padding(
              padding: const EdgeInsets.only(
                  top: MessageSpacing.large,
                  bottom: MessageSpacing.veryLarge * 2),
              child: _instacloneIcon(context),
            ),
            trailing: Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: MessageSpacing.large),
                  child: _profileIcon(context),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onDestinationSelected(int index) {
    navigationShell!.goBranch(
      index,
      initialLocation: index == navigationShell!.currentIndex,
    );
  }

  List<NavigationRailDestination> _sideNavigationList(BuildContext context) {
    return [
      NavigationRailDestination(
        icon: _icon(IconRes.messenger),
        label: const SizedBox(),
      ),
    ];
  }

  List<BottomNavigationBarItem> _bottomNavigationList(BuildContext context) {
    return [
      BottomNavigationBarItem(icon: _icon(IconRes.messenger), label: ''),
      BottomNavigationBarItem(icon: _profileIcon(context), label: ''),
    ];
  }

  Widget _profileIcon(BuildContext context) {
    return const MessageCircleAvatar(
      image: IconRes.testOnly,
      radius: MessageCircleAvatarSize.small,
    );
  }

  Widget _instacloneIcon(BuildContext context) {
    return InkWell(
      onTap: () {
        context.goNamed(MessageRouteNames.home);
      },
      child: _icon(IconRes.instagram),
    );
  }

  Widget _icon(String assetName) =>
      Image.asset(assetName, color: Colors.white, scale: 2.3);
}
