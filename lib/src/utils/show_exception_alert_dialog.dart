part of 'alert_dialogs.dart';

void showExceptionAlertDialog({
  required BuildContext context,
  required String title,
  required dynamic exception,
}) =>
    toastification.show(
      context: context,
      title: const Text('Error',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      description: Text(_message(exception)),
      type: ToastificationType.error,
      style: ToastificationStyle.flatColored,
      autoCloseDuration: const Duration(seconds: 5),
    );
// showSnackBar(context: context, text: _message(exception));
// showAlertDialog(
//   context: context,
//   title: title,
//   content: _message(exception),
//   defaultActionText: 'OK',
// );

String _message(dynamic exception) {
  if (exception is AppException) {
    return exception.message;
  }
  if (exception is DioException) {
    return ServerException(exception).message;
  }
  if (exception is PlatformException) {
    return exception.message ?? exception.toString();
  }
  return exception.toString();
}
