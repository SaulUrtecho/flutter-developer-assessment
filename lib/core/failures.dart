import 'package:equatable/equatable.dart';

// class made to handle errors
abstract class Failures extends Equatable {
  const Failures();

  @override
  List<Object?> get props => [];
}

// class for handle server errors
class ServerFailure extends Failures {}
