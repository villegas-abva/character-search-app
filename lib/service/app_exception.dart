import 'package:equatable/equatable.dart';

class AppException extends Equatable implements Exception {
  const AppException(this.errorMessage, this.source);

  @override
  List<Object?> get props => [errorMessage, source];

  final String errorMessage;
  final Object? source;

  factory AppException.fromObject(Object obj) {
    if (obj is AppException) {
      return obj; // No need to wrap if it's already an AppException
    }

    return AppException('', obj);
  }
}
