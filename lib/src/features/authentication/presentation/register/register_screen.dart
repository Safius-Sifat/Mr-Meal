import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../common_widgets/primary_button.dart';
import '../../../../constants/app_sizes.dart';
import '../../../../constants/constants.dart';
import '../../../../l10n/string_hardcoded.dart';
import '../../../../routing/app_router.dart';
import '../../../../utils/async_value_ui.dart';
import '../../../products/presentation/widgets/photo.dart';
import '../email_password_validators.dart';
import '../string_validators.dart';
import 'register_controller.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key, this.onSignedIn});
  final VoidCallback? onSignedIn;

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen>
    with EmailAndPasswordValidators {
  final _formKey = GlobalKey<FormState>();
  final _node = FocusScopeNode();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _phoneController = TextEditingController();

  String get name => _nameController.text;
  String get email => _emailController.text;
  String get password => _passwordController.text;
  String get confirmPassword => _confirmPasswordController.text;
  String get phone => _phoneController.text;
// local variable used to apply AutovalidateMode.onUserInteraction and show
  // error hints only when the form has been submitted
  var _submitted = false;

  @override
  void dispose() {
    _node.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    setState(() => _submitted = true);
    // only submit the form if validation passes
    if (_formKey.currentState!.validate()) {
      final controller = ref.read(registerControllerProvider.notifier);
      final success = await controller.registerWithEmailPassword(
          name, email, phone, password, confirmPassword);
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
    final state = ref.watch(registerControllerProvider);
    ref.listen<AsyncValue<dynamic>>(
      registerControllerProvider,
      (_, state) => state.showAlertDialogOnError(context),
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: FocusScope(
          node: _node,
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: Sizes.p16),
              child: SafeArea(
                child: Column(
                  children: [
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
                              text: 'Register your account'.hardcoded,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(fontSize: Sizes.p16)),
                        ],
                      ),
                    ),
                    gapH16,
                    TextFormField(
                      textAlign: TextAlign.center,
                      controller: _nameController,
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (name) =>
                          !_submitted ? null : userNameErrorText(name ?? ''),
                      autocorrect: false,
                      decoration: InputDecoration(
                        hintText: 'Your name'.hardcoded,
                        hintStyle: const TextStyle(
                          color: textFieldHint,
                          fontSize: Sizes.p16,
                        ),
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
                      textAlign: TextAlign.center,
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
                        hintText: 'Email'.hardcoded,
                        hintStyle: const TextStyle(
                          color: textFieldHint,
                          fontSize: Sizes.p16,
                        ),
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
                      textAlign: TextAlign.center,
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                      textInputAction: TextInputAction.next,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (phone) => !_submitted
                          ? null
                          : phoneNumberErrorText(phone ?? ''),
                      autocorrect: false,
                      inputFormatters: <TextInputFormatter>[
                        ValidatorInputFormatter(
                            editingValidator:
                                PhoneNumberEditingRegexValidator()),
                      ],
                      decoration: InputDecoration(
                        hintText: 'Phone number',
                        hintStyle: const TextStyle(
                          color: textFieldHint,
                          fontSize: Sizes.p16,
                        ),
                        enabled: !state.isLoading,
                        prefixIcon: Container(
                          margin:
                              const EdgeInsets.symmetric(horizontal: Sizes.p8),
                          padding: const EdgeInsets.all(Sizes.p8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(Sizes.p8),
                            color: neutralColor,
                          ),
                          child: Text(
                            '+88',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(fontSize: Sizes.p12),
                          ),
                        ),
                        prefixIconConstraints: const BoxConstraints(
                          minHeight: Sizes.p16,
                          minWidth: Sizes.p16,
                        ),
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
                      textAlign: TextAlign.center,
                      controller: _passwordController,
                      textInputAction: TextInputAction.next,
                      obscureText: true,
                      autocorrect: false,
                      keyboardType: TextInputType.visiblePassword,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      onEditingComplete: _passwordEditingComplete,
                      validator: (password) => !_submitted
                          ? null
                          : passwordErrorText(password ?? '',
                              EmailPasswordSignInFormType.register),
                      decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: const TextStyle(
                          color: textFieldHint,
                          fontSize: Sizes.p16,
                        ),
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
                      textAlign: TextAlign.center,
                      controller: _confirmPasswordController,
                      textInputAction: TextInputAction.done,
                      obscureText: true,
                      autocorrect: false,
                      keyboardType: TextInputType.visiblePassword,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      onEditingComplete: _passwordEditingComplete,
                      validator: (confirmPassword) => !_submitted
                          ? null
                          : confirmPasswordErrorText(
                              password, confirmPassword ?? ''),
                      decoration: InputDecoration(
                        hintText: 'Confirm password',
                        hintStyle: const TextStyle(
                          color: textFieldHint,
                          fontSize: Sizes.p16,
                        ),
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
                          onPressed: () {},
                          child: Text(
                            'Forgot Password?'.hardcoded,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(fontSize: Sizes.p16),
                          ),
                        ),
                      ],
                    ),
                    gapH16,
                    PrimaryButton(
                      text: 'Sign up'.hardcoded,
                      isLoading: state.isLoading,
                      onPressed: state.isLoading ? null : _submit,
                    ),
                    gapH20,
                    Row(
                      children: [
                        Checkbox(value: true, onChanged: (value) {}),
                        gapW8,
                        Expanded(
                          child: Text(
                            'By clicking this box, you certify that you agree to our Privacy Policy & Teams & Condition'
                                .hardcoded,
                          ),
                        ),
                      ],
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
                          Text('Already have an account?'.hardcoded,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(fontSize: Sizes.p16)),
                          TextButton(
                            onPressed: () {
                              context.goNamed(AppRoute.login.name);
                            },
                            child: Text(
                              'Sign in'.hardcoded,
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
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
