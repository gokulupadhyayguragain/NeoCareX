// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:patient_app/features/emergency/data/datasources/remote_datasource.dart'
    as _i538;
import 'package:patient_app/features/emergency/data/repositories/emergency_contact_repository.dart'
    as _i47;
import 'package:patient_app/features/emergency/presentation/bloc/emergency_contact_bloc.dart'
    as _i354;
import 'package:patient_app/features/home/data/repository/health_repository.dart'
    as _i38;
import 'package:patient_app/features/home/data/services/rook_module.dart'
    as _i780;
import 'package:patient_app/features/home/data/services/rook_service_web.dart'
    as _i441;
import 'package:patient_app/features/home/presentation/bloc/health_bloc.dart'
    as _i1015;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final rookModule = _$RookModule();
    final networkModule = _$NetworkModule();
    gh.lazySingleton<_i441.RookService>(() => rookModule.rookService);
    gh.lazySingleton<_i361.Dio>(() => networkModule.dio);
    gh.lazySingleton<_i538.RemoteDataSource>(
        () => _i538.RemoteDataSourceImpl(gh<_i361.Dio>()));
    gh.lazySingleton<_i38.HealthRepository>(
        () => _i38.HealthRepositoryImpl(gh<_i441.RookService>()));
    gh.lazySingleton<_i47.EmergencyContactRepository>(() =>
        _i47.EmergencyContactRepositoryImpl(gh<_i538.RemoteDataSource>()));
    gh.factory<_i1015.HealthBloc>(
        () => _i1015.HealthBloc(gh<_i38.HealthRepository>()));
    gh.factory<_i354.EmergencyContactBloc>(() =>
        _i354.EmergencyContactBloc(gh<_i47.EmergencyContactRepository>()));
    return this;
  }
}

class _$RookModule extends _i780.RookModule {}

class _$NetworkModule extends _i538.NetworkModule {}
