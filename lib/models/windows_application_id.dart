import 'package:mason/mason.dart';

/// Identifies the Windows application.
///
/// Gets used as part of the Runner.rc company name and its copyright notice.
extension type WindowsApplicationId(String value) {
  /// Creates a new [WindowsApplicationId] from the provided [organizationName]
  /// and [projectName].
  ///
  /// This is the default fallback value for the application ID.
  factory WindowsApplicationId.fallback({
    required String organizationName,
    required String projectName,
  }) {
    final List<String> parts = <String>[];
    for (final String part in organizationName.split('.')) {
      if (part.isEmpty) {
        continue;
      }
      parts.add(part.paramCase);
    }
    parts.add(projectName.paramCase);

    return WindowsApplicationId(parts.join('.'));
  }
}
