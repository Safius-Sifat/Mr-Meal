import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../exception/app_exception.dart';
import '../exception/dio_exception.dart';

class ErrorMessageWidget extends StatelessWidget {
  const ErrorMessageWidget(this.errorMessage, {super.key});
  final Object errorMessage;

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

  @override
  Widget build(BuildContext context) {
    return Text(
      _message(errorMessage),
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodyLarge,
    );
  }
}
