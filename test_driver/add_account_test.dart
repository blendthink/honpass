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

      await Future<void>.delayed(const Duration(milliseconds: 500));

      final accountScreenFinder = find.byValueKey('account_screen');
      expect(accountScreenFinder != null, true);

      final serviceDropDownFinder = find.byValueKey('service_drop_down');
      await driver.tap(serviceDropDownFinder);

      await Future<void>.delayed(const Duration(milliseconds: 500));

      final serviceDropDownItemApple = find.byValueKey('Apple');
      await driver.tap(serviceDropDownItemApple);

      await Future<void>.delayed(const Duration(milliseconds: 500));

      final userTextField = find.byValueKey('user_text_field');
      await driver.tap(userTextField);
      await driver.enterText('demo@gmail.com');

      await Future<void>.delayed(const Duration(milliseconds: 500));

      final passwordTextField = find.byValueKey('password_text_field');
      await driver.tap(passwordTextField);
      await driver.enterText('demo');

      await Future<void>.delayed(const Duration(milliseconds: 500));

      final buttonDone = find.byValueKey('done');
      await driver.tap(buttonDone);
    });
  });
}
