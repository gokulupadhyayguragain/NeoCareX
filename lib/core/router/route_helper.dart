import 'package:flutter/material.dart';

/// {@template navigation_destination}
/// The NavigationDestination class defines a navigation destination
/// with an icon, label, and route name.
/// {@endtemplate}
class NavigationDestination {
  /// `IconData icon;` is declaring a variable `icon` of type `IconData`. This variable will be used to
  /// store an icon that will be displayed in the UI.
  IconData icon;

  /// `String label;` is declaring a variable `label` of type `String`. This variable will be used to
  /// store a label that will be displayed in the UI for a navigation destination.
  String label;

  /// `String routeName;` is declaring a variable `routeName` of type `String`. This variable will be
  /// used to store the name of a route for a navigation destination. It is used in the
  /// `NavigationDestination` class to define a navigation destination with an icon, label, and route
  /// name. The route name is used to navigate to the corresponding page when the navigation destination
  /// is clicked.
  String routeName;

  /// {@macro navigation_destination}
  NavigationDestination({
    required this.icon,
    required this.label,
    required this.routeName,
  });
}

final navigationDestinations = [
  NavigationDestination(icon: (Icons.home), label: 'Home', routeName: '/home'),
  NavigationDestination(
    icon: Icons.insights,
    label: 'Insights',
    routeName: '/insights',
  ),
  NavigationDestination(
    icon: Icons.history,
    label: 'History',
    routeName: '/history',
  ),
  NavigationDestination(
    icon: Icons.person,
    label: 'Profile',
    routeName: '/profile',
  ),
  NavigationDestination(
    icon: Icons.summarize,
    label: 'Summary',
    routeName: '/summarization',
  ),

  NavigationDestination(
    icon: Icons.people,
    label: 'Create User',
    routeName: '/create-user',
  ),
  NavigationDestination(
    icon: Icons.payment,
    label: 'Payment',
    routeName: '/payment-screen',
  ),
  NavigationDestination(
    icon: Icons.more_horiz,
    label: 'More',
    routeName: '/more',
  ),
  NavigationDestination(
    icon: Icons.person_2_sharp,
    label: 'Create Org\n   Admin',
    routeName: '/create-organization-admin',
  ),
];
