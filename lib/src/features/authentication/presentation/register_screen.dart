import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../common_widgets/primary_button.dart';
import '../../../constants/app_sizes.dart';
import '../../../constants/constants.dart';
import '../../../l10n/string_hardcoded.dart';
import '../../../routing/app_router.dart';
import '../../products/presentation/widgets/photo.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _phoneController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.p16),
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
                textAlign: TextAlign.center,
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  hintText: 'Name, email or username',
                  hintStyle: const TextStyle(
                    color: textFieldHint,
                    fontSize: Sizes.p16,
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
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  hintText: 'Phone number',
                  hintStyle: const TextStyle(
                    color: textFieldHint,
                    fontSize: Sizes.p16,
                  ),
                  prefixIcon: Container(
                    margin: const EdgeInsets.symmetric(horizontal: Sizes.p8),
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
                textInputAction: TextInputAction.done,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  hintStyle: const TextStyle(
                    color: textFieldHint,
                    fontSize: Sizes.p16,
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
                controller: _confirmPasswordController,
                textInputAction: TextInputAction.done,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Confirm password',
                  hintStyle: const TextStyle(
                    color: textFieldHint,
                    fontSize: Sizes.p16,
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
                onPressed: () {},
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
                            .copyWith(fontSize: Sizes.p16, color: primaryColor),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
