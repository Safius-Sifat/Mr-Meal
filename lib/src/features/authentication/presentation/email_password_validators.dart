import '../../../l10n/string_hardcoded.dart';
import 'string_validators.dart';

enum EmailPasswordSignInFormType { signIn, register }

/// Mixin class to be used for client-side email & password validation
mixin EmailAndPasswordValidators {
  final StringValidator emailSubmitValidator = EmailSubmitRegexValidator();
  final StringValidator passwordRegisterSubmitValidator =
      MinLengthStringValidator(8);
  final StringValidator phoneNumberSubmitValidator =
      PhoneNumberSubmitRegexValidator();

  final StringValidator passwordSignInSubmitValidator =
      NonEmptyStringValidator();

  bool canSubmitEmail(String email) {
    return emailSubmitValidator.isValid(email);
  }

  bool canSubmitPassword(
      String password, EmailPasswordSignInFormType formType) {
    if (formType == EmailPasswordSignInFormType.register) {
      return passwordRegisterSubmitValidator.isValid(password);
    }
    return passwordSignInSubmitValidator.isValid(password);
  }

  bool canSubmitPhoneNumber(String phoneNumber) {
    return phoneNumberSubmitValidator.isValid(phoneNumber);
  }

  String? emailErrorText(String email) {
    final bool showErrorText = !canSubmitEmail(email);
    final String errorText = email.isEmpty
        ? "Email can't be empty".hardcoded
        : 'Invalid email'.hardcoded;
    return showErrorText ? errorText : null;
  }

  String? passwordErrorText(
      String password, EmailPasswordSignInFormType formType) {
    final bool showErrorText = !canSubmitPassword(password, formType);
    final String errorText = password.isEmpty
        ? "Password can't be empty".hardcoded
        : 'Password is too short'.hardcoded;
    return showErrorText ? errorText : null;
  }

  String? phoneNumberErrorText(String phoneNumber) {
    final bool showErrorText = !canSubmitPhoneNumber(phoneNumber);
    final String errorText = phoneNumber.isEmpty
        ? "Phone number can't be empty".hardcoded
        : 'Invalid phone number'.hardcoded;
    return showErrorText ? errorText : null;
  }

  String? userNameErrorText(String userName) {
    return userName.isEmpty ? "User name can't be empty".hardcoded : null;
  }

  String? confirmPasswordErrorText(String password, String confirmPassword) {
    return password != confirmPassword
        ? "Passwords don't match".hardcoded
        : null;
  }
}
