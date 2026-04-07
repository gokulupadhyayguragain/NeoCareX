// main.dart
import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:auth0_flutter/auth0_flutter_web.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart' show kDebugMode, kIsWeb;
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:openEMR/openEMR.dart';
import 'package:patient_app/constants/environment.dart';
import 'package:patient_app/core/di/injection.dart';
import 'package:patient_app/core/router/app_router.dart';
import 'package:patient_app/core/theme/app_theme.dart';
import 'package:patient_app/core/theme/theme_cubit.dart';
import 'package:patient_app/features/emergency/data/datasources/remote_datasource.dart';
import 'package:patient_app/features/emergency/data/repositories/emergency_contact_repository.dart';
import 'package:patient_app/features/emergency/presentation/bloc/emergency_contact_bloc.dart';
import 'package:patient_app/features/home/data/services/rook_service_web.dart';
import 'package:patient_app/features/home/data/services/wearable_sync_manager.dart';
import 'package:patient_app/features/home/data/services/rook_apple_health_service.dart';
import 'package:patient_app/features/home/presentation/bloc/health_bloc.dart';
import 'package:patient_app/features/launch/presentation/bloc/openEmrBloc/open_emr_bloc.dart';
import 'package:patient_app/features/login/data/auth_service.dart';
import 'package:patient_app/features/login/presentation/auth0_service_bloc/bloc/auth0_service_bloc.dart';
import 'package:patient_app/features/medications/data/local_datasources/medication_model.dart';
import 'package:patient_app/features/primary/presentation/bloc/bloc/profile_bloc_bloc.dart';
import 'package:patient_app/firebase_options.dart';
import 'package:patient_app/test_user.dart';
import 'package:provider/provider.dart';
import 'package:rook_sdk_apple_health/rook_sdk_apple_health.dart';
import 'package:rook_sdk_core/rook_sdk_core.dart';
import 'dart:io' show Platform;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('authBox');
  usePathUrlStrategy();
  Hive.registerAdapter(MedicationModelAdapter());
  Hive.registerAdapter(TimeOfDayModelAdapter());
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await configureDependencies();

  if (!kIsWeb && Platform.isIOS) {
    await _initializeRookAppleHealth();
  }

  await OpenEMRConfig().init(
    OpenEMRAuthConfig(
      redirectUri: Environment.oauth2RedirectUri,
      scopes: [
        "openid",
        "online_access",
        "offline_access",
        "launch",
        "api:oemr",
        "api:fhir",
        "api:port",
        // "site:default",
        "patient/Patient.read",
        "patient/Observation.read",
        "patient/Encounter.read",
        "patient/Coverage.read",
        "patient/Organization.read",
        "patient/Provenance.read",
        "user/Patient.read",
        "user/Observation.read",
        "user/Encounter.read",
        "user/Coverage.read",
        "system/Coverage.read",
        "patient/Practitioner.read",
        "system/Practitioner.read",
        "user/Practitioner.read",
        "patient/Appointment.read",
        "system/Appointment.read",
        "user/Appointment.read",
      ],
      clientId: Environment.openEMRClientId,
      clientSecret: Environment.openEMRClientSecret,
      audience: Environment.openEMRFhirURL,
      baseURL: Environment.openEMRBaseURL,
    ),
  );

  runApp(const MyApp());
}

Future<void> _initializeRookAppleHealth() async {
  try {

    const clientUUID = Environment.rookClientUuid;
    const secretKey = Environment.rookSecretKey;

    const environment = RookEnvironment.production;

    final appleHealthService = RookAppleHealthService();

    final initialized = await appleHealthService.initialize(
      clientUUID: clientUUID,
      secretKey: secretKey,
      environment: environment,
      enableBackgroundSync: false,
      enableLogs: kDebugMode,
    );

    if (!initialized) {
      debugPrint('[Main] Failed to initialize Rook Apple Health SDK');
      return;
    }
    await appleHealthService.updateUserID(await TestUser.getUserId());
    await appleHealthService.syncUserTimeZone();

    await appleHealthService.enableContinuousUpload(
      clientUUID: clientUUID,
      secretKey: secretKey,
      environment: environment,
      enableNativeLogs: kDebugMode,
    );
    await appleHealthService.enableBackgroundSync(
      clientUUID: clientUUID,
      secretKey: secretKey,
      environment: environment,
      enableNativeLogs: kDebugMode,
    );

    if (Platform.isIOS) {
      AHRookBackgroundSync.enableBackground(
        clientUUID: clientUUID,
        secretKey: secretKey,
        environment: environment,
        enableNativeLogs: kDebugMode,
      );
    }
  } catch (e) {
    debugPrint('[Main] ✗ Failed to initialize Rook Apple Health SDK: $e');
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(create: (_) => getIt<HealthBloc>()),
        BlocProvider(create: (_) => ThemeCubit()),
        BlocProvider<ProfileBlocBloc>(
          create: (context) => ProfileBlocBloc()..add(LoadPatientProfile('')),
        ),
        BlocProvider<Auth0ServiceBloc>(
          create: (context) => Auth0ServiceBloc(AuthService()),
        ),
        BlocProvider<OpenemrEhrLaunchBloc>(
          create: (context) => OpenemrEhrLaunchBloc(OpenEMRConfig().repository),
        ),
        ChangeNotifierProvider(
          create: (context) => RookService()..init(),
          lazy: false,
        ),
        ChangeNotifierProvider<WearablesSyncManager>(
          create: (context) =>
              WearablesSyncManager(context.read<RookService>()),
          lazy: false,
        ),
        ChangeNotifierProvider<RookAppleHealthService>(
          create: (context) => RookAppleHealthService(),
          lazy: false,
        ),
        BlocProvider(create: (_) => getIt<EmergencyContactBloc>()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          final auth0ServiceBloc = context.read<Auth0ServiceBloc>();

          return MaterialApp.router(
            title: 'VitalCareX',
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeMode,
            routerConfig: AppRouter.createRouter(auth0ServiceBloc),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
