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

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String registerIdentifiers = '';
  String fullName = '';
  String userName = '';
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
            _buildAppName(),
            const SizedBox(height: MessageSpacing.extraLarge),
            _buildSubHeader(),
            const SizedBox(height: MessageSpacing.extraLarge),
            _buildRegisterIdentifier(),
            const SizedBox(height: MessageSpacing.small),
            _buildFullName(),
            const SizedBox(height: MessageSpacing.small),
            _buildUserName(),
            const SizedBox(height: MessageSpacing.small),
            _buildPassword(),
            const SizedBox(height: MessageSpacing.small),
            _buildLearnMore(),
            const SizedBox(height: MessageSpacing.small),
            _buildPolicy(),
            const SizedBox(height: MessageSpacing.small),
            _buildSignUp(),
            const SizedBox(height: MessageSpacing.large),
            _buildLoginRoute(),
          ],
        ),
      ),
    );
  }

  Widget _buildAppName() => const MessageText(
        text: 'Message Clone',
        fontSize: MessageFontSize.extraLarge,
        fontWeight: FontWeight.bold,
      );

  Widget _buildSubHeader() => MessageText(
        text: AppLocalizations.of(context)!.registerSubHeader,
      );

  Widget _buildRegisterIdentifier() => MessageTextField(
        label: AppLocalizations.of(context)!.email,
        onChanged: (text) {
          registerIdentifiers = text;
        },
      );

  Widget _buildFullName() => MessageTextField(
        label: AppLocalizations.of(context)!.fullName,
        onChanged: (text) {
          fullName = text;
        },
      );

  Widget _buildUserName() => MessageTextField(
        label: AppLocalizations.of(context)!.userName,
        onChanged: (text) {
          userName = text;
        },
      );

  Widget _buildPassword() => MessageTextField(
        label: AppLocalizations.of(context)!.password,
        onChanged: (text) {
          password = text;
        },
      );

  Widget _buildLearnMore() => MessageText(
        text: AppLocalizations.of(context)!.registerLearnMore,
        color: Colors.grey,
      );

  Widget _buildPolicy() => MessageText(
        text: AppLocalizations.of(context)!.registerPolicy,
        color: Colors.grey,
      );

  Widget _buildSignUp() => MessageButton(
        width: double.infinity,
        buttonType: MessageButtonType.secondary,
        text: AppLocalizations.of(context)!.signUp,
        onPressed: () {},
      );

  Widget _buildLoginRoute() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MessageText(text: '${AppLocalizations.of(context)!.haveAnAccount} '),
          InkWell(
            onTap: () => context.goNamed(MessageRouteNames.login),
            child: MessageText(
              text: AppLocalizations.of(context)!.login,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      );
}
