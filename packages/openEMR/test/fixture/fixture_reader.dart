import 'dart:io';

extension StringX on String {
  String get readFile => File('test/fixture/$this.json').readAsStringSync();
}
