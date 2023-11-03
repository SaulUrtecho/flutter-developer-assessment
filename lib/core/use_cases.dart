import 'package:either_dart/either.dart';
import 'package:thrones_app/core/failures.dart';

// This use case can receive any type of data from a datasource
abstract class GetDataUseCase<Out> {
  Future<Either<Failures, Out>> run();
}
