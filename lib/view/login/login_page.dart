import 'package:cj_flutter_riverpod_messaging_app/common/constants/spacing.dart';
import 'package:cj_flutter_riverpod_messaging_app/common/enums/button_type.dart';
import 'package:cj_flutter_riverpod_messaging_app/common/enums/font_size.dart';
import 'package:cj_flutter_riverpod_messaging_app/common/routes/route_names.dart';
import 'package:cj_flutter_riverpod_messaging_app/common/utils/build_context_ext.dart';
import 'package:cj_flutter_riverpod_messaging_app/common/widgets/app_bar.dart';
import 'package:cj_flutter_riverpod_messaging_app/common/widgets/buttons.dart';
import 'package:cj_flutter_riverpod_messaging_app/common/widgets/text.dart';
import 'package:cj_flutter_riverpod_messaging_app/common/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String loginIdentifier = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    return MessageAppBar(
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: context.padding +
                (Breakpoints.small.isActive(context)
                    ? MessageSpacing.verySmall
                    : MessageSpacing.small)),
        child: Column(
          children: [
            const SizedBox(height: MessageSpacing.small),
            _buildHeader(),
            const SizedBox(height: MessageSpacing.extraLarge * 2),
            _buildLoginIdentifiers(),
            const SizedBox(height: MessageSpacing.small),
            _buildPassword(),
            const SizedBox(height: MessageSpacing.medium),
            _buildLogin(),
            const SizedBox(height: MessageSpacing.extraLarge * 4),
            _buildRegisterRoute(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() => const MessageText(
        text: 'Message Clone',
        fontSize: MessageFontSize.extraLarge,
        fontWeight: FontWeight.bold,
      );

  Widget _buildLoginIdentifiers() => MessageTextField(
        label: AppLocalizations.of(context)!.userNameOrEmail,
        onChanged: (text) {
          loginIdentifier = text;
        },
      );

  Widget _buildPassword() => MessageTextField(
        label: AppLocalizations.of(context)!.password,
        onChanged: (text) {
          password = text;
        },
      );

  Widget _buildLogin() => MessageButton(
        width: double.infinity,
        buttonType: MessageButtonType.secondary,
        text: AppLocalizations.of(context)!.login,
        onPressed: () {},
      );

  Widget _buildRegisterRoute() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MessageText(
              text: '${AppLocalizations.of(context)!.dontHaveAnAccount} '),
          InkWell(
            onTap: () => context.goNamed(MessageRouteNames.register),
            child: MessageText(
              text: AppLocalizations.of(context)!.signUp,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      );
}
