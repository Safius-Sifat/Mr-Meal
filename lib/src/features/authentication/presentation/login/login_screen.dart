import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../common_widgets/primary_button.dart';
import '../../../../constants/app_sizes.dart';
import '../../../../constants/constants.dart';
import '../../../../l10n/string_hardcoded.dart';
import '../../../../routing/app_router.dart';
import '../../../products/presentation/widgets/photo.dart';
import '../email_password_validators.dart';
import '../string_validators.dart';
import 'login_controller.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key, this.onSignedIn});

  final VoidCallback? onSignedIn;
  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen>
    with EmailAndPasswordValidators {
  final _formKey = GlobalKey<FormState>();
  final _node = FocusScopeNode();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String get email => _emailController.text;
  String get password => _passwordController.text;
// local variable used to apply AutovalidateMode.onUserInteraction and show
  // error hints only when the form has been submitted
  var _submitted = false;

  @override
  void dispose() {
    _node.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    setState(() => _submitted = true);
    // only submit the form if validation passes
    if (_formKey.currentState!.validate()) {
      final controller = ref.read(loginControllerProvider.notifier);
      final success = await controller.loginWithEmailAndPassword(
        email,
        password,
      );
      if (context.mounted && success) {
        widget.onSignedIn?.call();
        context.pushReplacementNamed(AppRoute.home.name);
      }
    }
  }

  void _emailEditingComplete() {
    if (canSubmitEmail(email)) {
      _node.nextFocus();
    }
  }

  void _passwordEditingComplete() {
    if (!canSubmitEmail(email)) {
      _node.previousFocus();
      return;
    }
    // _submit();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(loginControllerProvider);
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.p16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                gapH20,
                const Photo(
                  login,
                  fit: BoxFit.contain,
                ),
                gapH16,
                RichText(
                  text: TextSpan(
                    text: 'Hey Foodies, '.hardcoded,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontSize: Sizes.p16),
                    children: [
                      TextSpan(
                          text: 'Login to your account'.hardcoded,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(fontSize: Sizes.p16)),
                    ],
                  ),
                ),
                gapH16,
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (email) =>
                      !_submitted ? null : emailErrorText(email ?? ''),
                  autocorrect: false,
                  onEditingComplete: _emailEditingComplete,
                  inputFormatters: <TextInputFormatter>[
                    ValidatorInputFormatter(
                        editingValidator: EmailEditingRegexValidator()),
                  ],
                  decoration: InputDecoration(
                    hintText: 'Email address',
                    hintStyle: const TextStyle(
                      color: textFieldHint,
                      fontSize: Sizes.p16,
                    ),
                    prefixIcon: const Icon(Icons.email_rounded),
                    enabled: !state.isLoading,
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: textFieldColor),
                      borderRadius: BorderRadius.circular(Sizes.p8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(Sizes.p8),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(Sizes.p8),
                    ),
                    filled: true,
                    fillColor: textFieldColor,
                  ),
                ),
                gapH16,
                TextFormField(
                  controller: _passwordController,
                  textInputAction: TextInputAction.done,
                  obscureText: true,
                  autocorrect: false,
                  keyboardType: TextInputType.visiblePassword,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onEditingComplete: _passwordEditingComplete,
                  validator: (password) => !_submitted
                      ? null
                      : passwordErrorText(
                          password ?? '', EmailPasswordSignInFormType.signIn),
                  decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: const TextStyle(
                      color: textFieldHint,
                      fontSize: Sizes.p16,
                    ),
                    prefixIcon: const Icon(Icons.password_rounded),
                    enabled: !state.isLoading,
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: textFieldColor),
                      borderRadius: BorderRadius.circular(Sizes.p8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(Sizes.p8),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(Sizes.p8),
                    ),
                    filled: true,
                    fillColor: textFieldColor,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        context.goNamed(AppRoute.askEmail.name);
                      },
                      child: Text(
                        'Forgot Password?'.hardcoded,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: Sizes.p16,
                              color: primaryColor,
                            ),
                      ),
                    ),
                  ],
                ),
                gapH8,
                PrimaryButton(
                  width: 150,
                  text: 'Login'.hardcoded,
                  isLoading: state.isLoading,
                  onPressed: state.isLoading ? null : _submit,
                ),
                gapH20,
                Row(
                  children: [
                    Flexible(
                      flex: 8,
                      child: Container(height: 1.5, color: Colors.black),
                    ),
                    Flexible(
                        flex: 2,
                        child: Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: Sizes.p8),
                          child: Text(
                            'OR',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(fontSize: Sizes.p12),
                          ),
                        )),
                    Flexible(
                      flex: 8,
                      fit: FlexFit.tight,
                      child: Container(height: 1.5, color: Colors.black),
                    )
                  ],
                ),
                gapH8,
                const Text(
                  'Sign in with',
                  style: TextStyle(fontSize: Sizes.p12),
                ),
                gapH8,
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(shape: const CircleBorder()),
                  child: Container(
                      height: Sizes.p20,
                      width: Sizes.p20,
                      margin: const EdgeInsets.all(Sizes.p8),
                      child: const Photo(google)),
                ),
                gapH16,
                Container(
                  padding: const EdgeInsets.all(Sizes.p4),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Sizes.p8),
                      color: tertiaryColor,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0, 2),
                          blurRadius: 4,
                        ),
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account?".hardcoded,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(fontSize: Sizes.p16)),
                      TextButton(
                        onPressed: () {
                          context.goNamed(AppRoute.register.name);
                        },
                        child: Text(
                          'Register now'.hardcoded,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                                  fontSize: Sizes.p16, color: primaryColor),
                        ),
                      ),
                    ],
                  ),
                ),
                gapH8,
                TextButton(
                    onPressed: () {
                      context.goNamed(AppRoute.home.name);
                    },
                    child: Text(
                      'Browse as a guest'.hardcoded,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontSize: Sizes.p12,
                          ),
                    ))
              ],
            ),
          ),
        )),
      ),
    );
  }
}
