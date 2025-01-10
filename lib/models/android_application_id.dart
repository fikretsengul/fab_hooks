// ignore_for_file: cascade_invocations, document_ignores

import 'package:mason/mason.dart';

/// Every Android app has a unique application ID that looks like a Java or
/// Kotlin package name, such as `com.example.app`.
///
/// This ID uniquely identifies your app on the device and in the Google Play
/// Store.
///
/// See also:
///
/// * [Set the application ID Android documentation](https://developer.android.com/build/configure-app-module#set-application-id)
extension type AndroidApplicationId(String value) {
  /// Creates a new [AndroidApplicationId] from the provided [organizationName],
  /// [projectName] and [applicationName].
  ///
  /// This is the default fallback value for the application ID.
  factory AndroidApplicationId.fallback({
    required String organizationName,
    required String projectName,
    required String applicationName,
  }) {
    final List<String> segments = <String>[];
    for (final String segment in organizationName.split('.')) {
      if (segment.isEmpty) {
        continue;
      }
      segments.add(segment.snakeCase);
    }
    segments.add(projectName.snakeCase);
    segments.add(applicationName);

    return AndroidApplicationId(segments.join('.'));
  }

  /// Checks if the [AndroidApplicationId] is valid, returning `true` if it is
  /// and `false` otherwise.
  ///
  /// Although the application ID looks like a traditional Kotlin or Java
  /// package name, the naming rules for the application ID are a bit more
  /// restrictive:
  ///
  /// * It must have at least two segments (one or more dots).
  /// * Each segment must start with a letter.
  /// * All characters must be alphanumeric or an underscore [a-zA-Z0-9_].
  ///
  /// See also:
  ///
  /// * [Set the application ID Android documentation](https://developer.android.com/build/configure-app-module#set-application-id)
  bool get isValid {
    final List<String> segments = value.split('.');
    if (segments.length < 2) {
      // It must have at least two segments (one or more dots).
      return false;
    }

    final RegExp isLetter = RegExp('^[a-zA-Z]');
    final RegExp isAlphanumeric = RegExp(r'^[a-zA-Z0-9_]+$');

    for (final String segment in segments) {
      if (segment.isEmpty || !isLetter.hasMatch(segment[0])) {
        // Each segment must start with a letter.
        return false;
      }

      if (!isAlphanumeric.hasMatch(segment)) {
        // All characters must be alphanumeric or an underscore [a-zA-Z0-9_].
        return false;
      }
    }

    return true;
  }
}
