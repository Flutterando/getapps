import 'package:asp/asp.dart';
import 'package:getapps/app/core/exceptions/exception.dart';

final baseLoadingState = atom<bool>(false);
final baseExceptionState = atom<AppException?>(null);
