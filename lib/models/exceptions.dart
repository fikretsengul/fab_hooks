import 'package:fab_hooks/models/android_application_id.dart';

abstract class HooksException implements Exception {
  HooksException({
    required this.description,
    required this.help,
  });

  /// A message describing the exception.
  final String description;

  /// A message describing how to resolve the exception, or signposting to
  /// additional resources.
  final String help;

  @override
  String toString() => '''
[$HooksException] $description.

$help
''';
}

class InvalidAndroidApplicationIdFormat extends HooksException {
  InvalidAndroidApplicationIdFormat(AndroidApplicationId applicationId)
      : super(
          description: '''An invalid Android application ID (${applicationId.value}) format was provided.''',
          help: '''
Try adjusting your Android application ID (${applicationId.value}) to match the following format:

* It must have at least two segments (one or more dots).
* Each segment must start with a letter.
* All characters must be alphanumeric or an underscore [a-zA-Z0-9_].

Although the application ID looks like a traditional Kotlin or Java
package name, the naming rules for the application ID are a bit more
restrictive.

For more information, see the "Set the application ID" Android documentation:
* https://developer.android.com/build/configure-app-module#set-application-id.
''',
        );
}
