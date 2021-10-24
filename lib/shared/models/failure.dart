import 'package:flutter/material.dart';

class Failure {
  final String message;
  final dynamic exception;

  Failure({
    @required this.message = '',
    this.exception,
  });
}
