import 'package:injectable/injectable.dart';
import 'package:patient_app/features/home/data/services/rook_service_web.dart';

@module
abstract class RookModule {
  @lazySingleton
  RookService get rookService => RookService();
}