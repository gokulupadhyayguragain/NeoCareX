import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:patient_app/core/auth/dio.dart';
import 'package:patient_app/core/storage/secure_storage.dart';
import 'package:patient_app/core/theme/theme_cubit.dart';
import 'package:patient_app/features/login/presentation/auth0_service_bloc/bloc/auth0_service_bloc.dart';
import 'package:patient_app/features/login/presentation/bloc/auth_bloc.dart';
import 'package:patient_app/features/payment/presentation/payment_webview.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:firebase_auth/firebase_auth.dart';

class MorePage extends StatefulWidget {
  const MorePage({super.key});

  @override
  State<MorePage> createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  @override
  void initState() {
    getPaymentInfo();
    super.initState();
  }

  getPaymentInfo() async {
    final storage = SecureStorageService();
    final role = await storage.readString('role');
    print("the role of the user is" + role.toString());
    if (role == "organizationadmin") {
      setState(() {
        isOrganizationAdmin = true;
      });
    }
    if (isOrganizationAdmin == true) {
      DioClient dioclient = DioClient();
      String url = '/sphere/get_transactions';
      final response = await dioclient.dio.get(url);

      if (response.data.length != 0) {
        setState(() {
          paymentCompleted = true;
        });
      }
    }
  }

  bool paymentCompleted = false;
  bool isOrganizationAdmin = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<Auth0ServiceBloc, Auth0ServiceState>(
      listener: (context, state) {
        state.maybeWhen(
          googleloggingout: () {
            // return '/login';
          },
          orElse: () {},
        );
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(title: const Text('More'), centerTitle: true),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            isOrganizationAdmin
                ? paymentCompleted
                      ? _buildPaymentVerification(icon: Icons.payment)
                      : _buildMenuItem(
                          icon: Icons.payment,
                          title: 'Complete Payment',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => WebviewPage01(
                                  callback: () {
                                    getPaymentInfo();
                                  },
                                ),
                              ),
                            );
                          },
                        )
                : Container(),
            _buildMenuItem(
              icon: Icons.medication,
              title: 'Medications',
              subtitle: 'Manage your medications and reminders',
              onTap: () => context.push('/medications'),
            ),
            _buildMenuItem(
              icon: Icons.emergency,
              title: 'Emergency Contacts',
              subtitle: 'Quick access to important contacts',
              onTap: () => context.push('/emergency-contacts'),
            ),
            const SizedBox(height: 16),
            _buildThemeToggle(context),
            const SizedBox(height: 16),
            _buildMenuItem(
              icon: Icons.settings,
              title: 'Settings',
              onTap: () {},
            ),
            _buildMenuItem(
              icon: Icons.help_outline,
              title: 'Help & Support',
              onTap: () {},
            ),
            _buildMenuItem(
              icon: Icons.privacy_tip_outlined,
              title: 'Privacy Policy',
              onTap: () {},
            ),

            _buildMenuItem(
              icon: Icons.info_outline,
              title: 'About',
              onTap: () {},
            ),
            // _buildMenuItem(
            //   icon: Icons.info_outline,
            //   title: 'Create User',
            //   onTap: () async {
            //     registerUser('sigavoc500@skateru.com', 'Password!1', {
            //       'role': 'Patient',
            //       'patient_id': "12345",
            //     });
            //   },
            // ),
            // _buildMenuItem(
            //   icon: Icons.info_outline,
            //   title: 'Get User Data',
            //   onTap: () async {
            //     getUserData();
            //   },
            // ),
            BlocBuilder<Auth0ServiceBloc, Auth0ServiceState>(
              builder: (context, state) {
                final isLoading = state.maybeWhen(orElse: () => false);

                return _buildMenuItem(
                  icon: Icons.logout,
                  title: isLoading ? 'Signing Out...' : 'Sign Out',
                  onTap: isLoading ? null : () => _showSignOutDialog(context),
                  isDestructive: true,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  // Future<Map<String, dynamic>?> getUserData() async {
  void _showSignOutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Sign Out'),
        content: const Text('Are you sure you want to sign out?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(dialogContext).pop();
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.of(dialogContext).pop();
              final storage = SecureStorageService();
              String? loginMethod = await storage.readString("method");
              print("The login method is");
              print(loginMethod);

              if (loginMethod == "google") {
                print("Hello1");
                // final prefs = await SharedPreferences.getInstance();
                // await prefs.clear();
                context.read<Auth0ServiceBloc>().add(
                  const Auth0ServiceEvent.googlelogout(),
                );
              } else if (loginMethod == "apple") {
                context.read<Auth0ServiceBloc>().add(
                  const Auth0ServiceEvent.applelogout(),
                );
              } else {
                print("Hello2");
                context.read<Auth0ServiceBloc>().add(
                  const Auth0ServiceEvent.logout(),
                );
              }
            },
            child: const Text('Sign Out', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  Widget _buildThemeToggle(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, themeMode) {
        return Container(
          margin: const EdgeInsets.only(bottom: 8),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: ListTile(
            leading: Icon(
              _getThemeIcon(themeMode),
              color: Theme.of(context).primaryColor,
            ),
            title: const Text(
              'Theme',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            subtitle: Text(context.read<ThemeCubit>().currentThemeText),
            trailing: IconButton(
              onPressed: () => context.read<ThemeCubit>().toggleTheme(),
              icon: const Icon(Icons.brightness_6),
            ),
          ),
        );
      },
    );
  }

  IconData _getThemeIcon(ThemeMode themeMode) {
    switch (themeMode) {
      case ThemeMode.light:
        return Icons.light_mode;
      case ThemeMode.dark:
        return Icons.dark_mode;
      case ThemeMode.system:
        return Icons.brightness_auto;
    }
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    String? subtitle,
    VoidCallback? onTap,
    bool isDestructive = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: isDestructive ? Colors.red : Colors.grey.shade600,
        ),
        title: Text(
          title,
          style: TextStyle(
            color: isDestructive ? Colors.red : null,
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: subtitle != null ? Text(subtitle) : null,
        trailing: onTap != null
            ? const Icon(Icons.chevron_right, color: Colors.grey)
            : const SizedBox(
                width: 16,
                height: 16,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
        onTap: onTap,
      ),
    );
  }
}

Widget _buildPaymentVerification({
  required IconData icon,
  bool isDestructive = false,
}) {
  return Container(
    margin: const EdgeInsets.only(bottom: 8),
    decoration: BoxDecoration(
      color: Colors.green,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.05),
          blurRadius: 5,
          offset: const Offset(0, 2),
        ),
      ],
    ),
    child: ListTile(
      leading: Icon(icon, color: isDestructive ? Colors.red : Colors.white),
      title: Text(
        "Payment Verified.",
        style: TextStyle(
          color: isDestructive ? Colors.red : Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: Icon(Icons.close, color: Colors.white),
    ),
  );
}
