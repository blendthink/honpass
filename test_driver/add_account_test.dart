import 'dart:io';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Honpass App', () {

    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('add account', () async {

      final homeScreenFinder = find.byValueKey('home_screen');
      expect(homeScreenFinder != null, true);

      await Future<void>.delayed(const Duration(milliseconds: 500));

      final fabFinder = find.byValueKey('floating_action_button');
      await driver.tap(fabFinder);

      final accountScreenFinder = find.byValueKey('account_screen');
      expect(accountScreenFinder != null, true);

      final serviceDropDownFinder = find.byValueKey('service_drop_down');
      await driver.tap(serviceDropDownFinder);

      final serviceDropDownItemApple = find.byValueKey('Apple');
      await driver.tap(serviceDropDownItemApple);

    });
  });
}
