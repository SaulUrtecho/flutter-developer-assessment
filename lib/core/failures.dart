import 'package:equatable/equatable.dart';

abstract class Failures extends Equatable {
  const Failures();

  @override
  List<Object?> get props => [];
}

// General failures
class ServerFailure extends Failures {}
