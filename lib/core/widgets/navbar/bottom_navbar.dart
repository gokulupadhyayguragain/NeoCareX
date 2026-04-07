import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:patient_app/core/router/route_helper.dart' as router;
import 'package:patient_app/core/storage/secure_storage.dart';
import 'dart:convert';

class BottomNavbar extends StatefulWidget {
  final Widget child;
  final GoRouterState state;

  const BottomNavbar({super.key, required this.child, required this.state});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int selectedIndex = 0;
  String? _role;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _checkUserRole();
  }

  Future<void> _checkUserRole() async {
    try {
      final storage = SecureStorageService();
      final accessToken = await storage.readString("access_token");

      if (accessToken != null) {
        final parts = accessToken.split('.');
        if (parts.length >= 2) {
          final payload = parts[1];
          final normalized = base64Url.normalize(payload);
          final decoded = utf8.decode(base64Url.decode(normalized));
          final Map<String, dynamic> jsonData = json.decode(decoded);

          final role = jsonData['http://example.com/role'];

          setState(() {
            _role = role;
            _isLoading = false;
          });
        }
      } else {
        setState(() => _isLoading = false);
      }
    } catch (e) {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final bool isDesktop = MediaQuery.of(context).size.width >= 800;
    final destinations = _getDestinationsBasedOnRole();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updateSelectedIndexFromRoute(widget.state.matchedLocation, destinations);
    });

    if (isDesktop) {
      return Scaffold(
        body: Row(
          children: [
            NavigationRail(
              scrollable: true,
              selectedIndex: selectedIndex,
              onDestinationSelected: (index) =>
                  _onItemTapped(index, context, destinations),
              selectedIconTheme: const IconThemeData(color: Colors.black),
              unselectedIconTheme: const IconThemeData(color: Colors.white),
              indicatorShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              minExtendedWidth: 180,
              labelType: NavigationRailLabelType.all,
              backgroundColor: Theme.of(context).primaryColor,
              leading: Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 0, 20),
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      if (_role == "systemadmin") {
                        context.go('/create-user');
                      } else if (_role == "organizationadmin") {
                        context.go('/payment-screen');
                      } else {
                        context.go('/home');
                      }
                    },
                    child: Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.asset(
                          'assets/images/logo.png',
                          height: 60,
                          width: 60,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              destinations: destinations
                  .map(
                    (e) => NavigationRailDestination(
                      padding: const EdgeInsets.fromLTRB(5, 0, 5, 5),
                      icon: Icon(e.icon, color: Colors.white),
                      selectedIcon: Icon(e.icon),
                      label: Text(
                        e.label,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                  .toList(),
            ),
            Expanded(child: widget.child),
          ],
        ),
      );
    } else {
      return Scaffold(
        body: widget.child,
        bottomNavigationBar: NavigationBar(
          height: 80,

          // backgroundColor: Theme.of(context).primaryColor,
          indicatorColor: Colors.blue.shade100,
          destinations: destinations
              .map(
                (e) => NavigationDestination(
                  icon: Icon(e.icon, color: Colors.black),
                  selectedIcon: Icon(
                    e.icon,
                    color: Theme.of(context).primaryColor,
                  ),
                  label: e.label,
                ),
              )
              .toList(),
          selectedIndex: selectedIndex,
          onDestinationSelected: (index) {
            setState(() => selectedIndex = index);
            _onItemTapped(index, context, destinations);
          },
        ),
      );
    }
  }

  void _onItemTapped(
    int index,
    BuildContext context,
    List<router.NavigationDestination> destinations,
  ) {
    setState(() => selectedIndex = index);
    final route = destinations[index].routeName;
    context.go(route);
  }

  void _updateSelectedIndexFromRoute(
    String currentRoute,
    List<router.NavigationDestination> destinations,
  ) {
    for (int i = 0; i < destinations.length; i++) {
      if (destinations[i].routeName == currentRoute) {
        if (selectedIndex != i) {
          setState(() {
            selectedIndex = i;
          });
        }
        break;
      }
    }
  }

  List<router.NavigationDestination> _getDestinationsBasedOnRole() {
    if (_role == "systemadmin") {
      return [
        router.navigationDestinations[5], // Create User
        router.navigationDestinations[8], // Create Organization Admin
        router.navigationDestinations[7], // More
      ];
    }

    if (_role == "organizationadmin") {
      return [
        router.navigationDestinations[6], // Payment
        router.navigationDestinations[7], // More
      ];
    }

    return [
      router.navigationDestinations[0], // Home
      router.navigationDestinations[1], // Insights
      router.navigationDestinations[2], // History
      router.navigationDestinations[3], // Profile
      router.navigationDestinations[4], // Summary
      router.navigationDestinations[7], // More
    ];
  }
}
