import 'package:cj_flutter_riverpod_messaging_app/common/constants/circle_avatar_size.dart';
import 'package:flutter/material.dart';

class MessageCircleAvatar extends StatelessWidget {
  final String image;
  final double? radius;
  const MessageCircleAvatar({
    super.key,
    required this.image,
    this.radius = MessageCircleAvatarSize.large,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      radius: (radius! + 4.0),
      child: CircleAvatar(
        backgroundColor: Colors.black,
        radius: (radius! + 2.0),
        child: CircleAvatar(
          backgroundImage: NetworkImage(image),
          radius: radius,
        ),
      ),
    );
  }
}
