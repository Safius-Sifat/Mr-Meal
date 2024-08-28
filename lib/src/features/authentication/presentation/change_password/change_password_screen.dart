import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChangePasswordScreen extends ConsumerStatefulWidget {
  const ChangePasswordScreen({required this.email, super.key});
  final String email;

  @override
  ConsumerState<ChangePasswordScreen> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends ConsumerState<ChangePasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Spacer(),
          Expanded(
            child: Row(
              children: [
                Spacer(),
                // Expanded(flex: 8, child: Image.asset(letter)),
                Spacer(),
              ],
            ),
          ),
          // AgrimateStyles.smallVGap,
          // Text(l10n.emailSentText,
          //     textAlign: TextAlign.center,
          //     style: Theme.of(context).textTheme.headlineLarge),
          // AgrimateStyles.smallVGap,
          // Padding(
          // padding: const EdgeInsets.all(AgrimateStyles.smallSize),

          //   textAlign: TextAlign.center,
          //   style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          //         color: Theme.of(context).colorScheme.onSurface,
          //       ),
          // ),
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Text(l10n.emailNotReceived),
              // TextButton(
              //   onPressed: () async {
              // final sentOrFailure = await ref
              //     .read(authRepositoryProvider)
              //     .sendPasswordResetEmail(widget.email);
              // sentOrFailure.fold(
              //     (failure) => failure.when(
              //         unKnown: () => showSnackBar(l10n.unknownError),
              //         server: (code, message) {
              //           showSnackBar(l10n.resetPasswordError);
              //         },
              //         noConnection: () =>
              //             showSnackBar(l10n.noConnectionError)),
              //     (r) => showSnackBar(l10n.emailSentText));
              // },
              // child: Text(l10n.sendAgain),
              // ),
            ],
          ),
          Spacer(),
          // CustomButton(
          //     onPressed: () {
          //       context.goNamed(AppRoutes.login.name);
          //     },
          //     text: l10n.login,
          //     width: 150),
          Spacer()
        ],
      ),
    );
  }
}
