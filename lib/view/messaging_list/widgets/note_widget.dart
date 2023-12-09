import 'package:cj_flutter_riverpod_messaging_app/common/constants/spacing.dart';
import 'package:cj_flutter_riverpod_messaging_app/common/utils/icon_res.dart';
import 'package:cj_flutter_riverpod_messaging_app/common/widgets/circle_avatar.dart';
import 'package:cj_flutter_riverpod_messaging_app/common/widgets/text.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NoteWidget extends StatefulWidget {
  const NoteWidget({super.key});

  @override
  State<NoteWidget> createState() => _NoteWidgetState();
}

class _NoteWidgetState extends State<NoteWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            _buildImageAvatar(),
            _buildNote(),
          ],
        ),
        const SizedBox(height: MessageSpacing.tiny),
        _buildName(),
      ],
    );
  }

  Widget _buildImageAvatar() {
    return const Padding(
      padding: EdgeInsets.only(top: MessageSpacing.small),
      child: MessageCircleAvatar(image: IconRes.testOnly),
    );
  }

  Widget _buildNote() {
    return Positioned(
      right: 30,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey,
        ),
        height: 30,
        width: 50,
        child: Center(
          child: MessageText(
            text: AppLocalizations.of(context)!.note,
          ),
        ),
      ),
    );
  }

  Widget _buildName() {
    return MessageText(
      text: AppLocalizations.of(context)!.yourNote,
      color: Colors.grey,
    );
  }
}
