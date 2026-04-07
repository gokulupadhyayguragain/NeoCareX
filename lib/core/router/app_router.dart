import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:patient_app/core/auth/email_verified_page.dart';
import 'package:patient_app/core/storage/secure_storage.dart';
import 'package:patient_app/core/widgets/navbar/bottom_navbar.dart';
import 'package:patient_app/features/createUser/presentation/create_organization_admin.dart';
import 'package:patient_app/features/createUser/presentation/create_user.dart';
import 'package:patient_app/features/emergency/presentation/pages/emergency_contacts_page.dart';
import 'package:patient_app/features/history/presentation/pages/history_page.dart';
import 'package:patient_app/features/home/presentation/ai_assistant_page.dart';
import 'package:patient_app/features/home/presentation/home_page.dart';
import 'package:patient_app/features/home/presentation/nutrition_page.dart';
import 'package:patient_app/features/home/presentation/wearables_connect_page.dart';
import 'package:patient_app/features/insight/presentation/insights_page.dart';
import 'package:patient_app/features/login/presentation/auth0_service_bloc/bloc/auth0_service_bloc.dart';
import 'package:patient_app/features/login/presentation/forgot_password_screen.dart';
import 'package:patient_app/features/login/presentation/login_screen.dart';
import 'package:patient_app/features/more/presentation/more_page.dart';
import 'package:patient_app/features/payment/presentation/payment_screen.dart';
import 'package:patient_app/features/primary/presentation/primary_page.dart';
import 'package:patient_app/features/medications/presentation/medications_page.dart';
import 'package:patient_app/features/splash/splash_screen.dart';
import 'package:patient_app/features/summarization/presentation/screens/summarization_screen.dart';
import '../../features/launch/presentation/openemr_launch_page.dart';

//final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();
bool isLaunchRoute = false;
bool isEmailVerificationRoute = false;
String emailverificationurl = '';

class AppRouter {
  static String _getInitialLocation() {
    try {
      final uri = Uri.base;
      final path = uri.path;
      final query = uri.query;

      if (path.isNotEmpty && path != '/') {
        return query.isNotEmpty ? '$path?$query' : path;
      }
    } catch (_) {}

    return '/splash?fromLogin=true';
  }

  static GoRouter createRouter(Auth0ServiceBloc auth0ServiceBloc) {
    final initialLocation = _getInitialLocation();

    return GoRouter(
      initialLocation: initialLocation,
      refreshListenable: GoRouterRefreshStream(auth0ServiceBloc.stream),
      routes: [
        GoRoute(
          path: '/email-verification',
          name: 'email-verification',
          builder: (context, state) {
            final success = state.uri.queryParameters['success'];
            if (success == 'true') {
              return const EmailVerifiedPage();
            }
            return const Scaffold(
              body: Center(child: Text("Verification failed")),
            );
          },
        ),
        GoRoute(
          path: '/splash',
          name: 'splash',
          builder: (context, state) {
            final queryParameters = state.uri.queryParameters;
            final fromLogin = state.uri.queryParameters['fromLogin'] == 'true';
            return SplashScreen(
              fromLogin: fromLogin,
              queryParameters: queryParameters,
            );
          },
        ),
        GoRoute(
          path: '/launch',
          name: 'launch',
          builder: (context, state) {
            return EHRLaunch(queryParameters: state.uri.queryParameters);
          },
        ),
        GoRoute(
          path: '/forgot-password',
          name: 'forgot-password',
          builder: (context, state) => ForgotPasswordScreen(isRecovery: true),
        ),
        GoRoute(
          path: '/login',
          name: 'login',
          builder: (context, state) {
            final redirect = state.uri.queryParameters["redirect"];
            return LoginScreen(redirect: redirect);
          },
        ),
        GoRoute(
          path: '/client_uuid/:clientUuid/user_id/:userId',
          name: 'rook-callback',
          builder: (context, state) {
            final clientUuid = state.pathParameters['clientUuid'];
            final userId = state.pathParameters['userId'];

            return SplashScreen(
              fromLogin: true,
              queryParameters: {
                "client_uuid": clientUuid ?? "",
                "user_id": userId ?? "",
              },
            );
          },
        ),
        ShellRoute(
          builder: (context, state, child) =>
              BottomNavbar(state: state, child: child),
          routes: [
            GoRoute(
              path: '/home',
              name: 'home',
              builder: (context, state) => const HomePage(),
            ),
            GoRoute(
              path: '/create-user',
              name: 'createuser',
              builder: (context, state) => const CreateUser(),
            ),
            GoRoute(
              path: '/create-organization-admin',
              name: 'createorganizationadmin',
              builder: (context, state) => const CreateOrganizationAdmin(),
            ),
            GoRoute(
              path: '/payment-screen',
              name: 'paymentscreen',
              builder: (context, state) => const PaymentScreen(),
            ),
            GoRoute(
              path: '/insights',
              name: 'insights',
              builder: (context, state) => const InsightsPage(),
            ),
            GoRoute(
              path: '/history',
              name: 'history',
              builder: (context, state) => const HistoryPage(),
            ),
            GoRoute(
              path: '/profile',
              name: 'profile',
              builder: (context, state) => const PrimaryPage(),
            ),
            GoRoute(
              path: '/summarization',
              name: 'summarization',
              builder: (context, state) => const SummarizationScreen(),
            ),
            GoRoute(
              path: '/more',
              name: 'more',
              builder: (context, state) => const MorePage(),
            ),
          ],
        ),
        GoRoute(
          path: '/nutrition-page',
          name: 'nutrition-page',
          builder: (context, state) => const NutritionPage(),
        ),
        GoRoute(
          path: '/medications',
          name: 'medications',
          builder: (context, state) => const MedicationsPage(),
        ),
        GoRoute(
          path: '/wearables',
          name: 'wearables',
          builder: (context, state) => const WearablesConnectPage(),
        ),
        GoRoute(
          path: '/emergency-contacts',
          name: 'emergency-contacts',
          builder: (context, state) => const EmergencyContactsPage(),
        ),
        GoRoute(
          path: '/ai-assistant',
          name: 'ai-assistant',
          builder: (context, state) => const AiAssistantPage(),
        ),
      ],

      redirect: (context, state) async {
        if (state.uri.path.contains('/email-verification')) return null;
        if (state.uri.path.contains('/client_uuid')) return null;
        if (state.uri.path.contains('/launch')) return state.uri.toString();

        final initialRoute = state.matchedLocation == '/';
        final isLoginRoute = state.matchedLocation == '/login';
        final isSplashRoute = state.matchedLocation == '/splash';
        isLaunchRoute = state.matchedLocation == '/launch';
        final isCreateUserRoute = state.matchedLocation == '/create-user';
        final isPaymentRoute = state.matchedLocation == '/payment-screen';
        final isMoreRoute = state.matchedLocation == '/more';
        final isCreateOrganizationAdminRoute =
            state.matchedLocation == '/create-organization-admin';

        if (state.matchedLocation.contains('/email-verification')) {
          isEmailVerificationRoute = true;
          emailverificationurl = state.uri.toString();
          return emailverificationurl;
        }
        if (isEmailVerificationRoute) {
          return emailverificationurl;
        }
        if (initialRoute) return '/home';

        final storage = SecureStorageService();
        final idToken = await storage.readString("access_token");
        final isAuthenticated = idToken != null && idToken != "null";

        if (!isAuthenticated) {
          if (isLoginRoute || isSplashRoute) return null;
          return '/login';
        }

        final role = await _getUserRole();

        // SYSTEM ADMIN
        if (role == "systemadmin") {
          if (isLoginRoute || isSplashRoute) return '/create-user';
          if (!isCreateUserRoute &&
              !isMoreRoute &&
              !isCreateOrganizationAdminRoute) {
            return '/create-user';
          }
        }
        // ORGANIZATION ADMIN
        else if (role == "organizationadmin") {
          if (isLoginRoute || isSplashRoute) return '/payment-screen';
          if (!isPaymentRoute && !isMoreRoute) return '/payment-screen';
        }
        // REGULAR USER
        else {
          if (isLoginRoute || isSplashRoute) return '/home';
          if (isCreateUserRoute) return '/home';
          return null;
        }

        return null;
      },
    );
  }

  static Future<String?> _getUserRole() async {
    try {
      final storage = SecureStorageService();
      final accessToken = await storage.readString("access_token");
      if (accessToken == null) return null;

      final parts = accessToken.split('.');
      if (parts.length >= 2) {
        final payload = parts[1];
        final normalized = base64Url.normalize(payload);
        final decoded = utf8.decode(base64Url.decode(normalized));
        final Map<String, dynamic> jsonData = json.decode(decoded);
        return jsonData['http://example.com/role'] as String?;
      }
    } catch (e) {
      return null;
    }
    return null;
  }
}

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    _subscription = stream.asBroadcastStream().listen(
      (dynamic _) => notifyListeners(),
    );
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
