import 'package:mason/mason.dart';

/// Identifies the Linux application.
///
/// Gets used as part of the Runner.rc company name and its copyright notice.
extension type LinuxApplicationId(String value) {
  /// Creates a new [LinuxApplicationId] from the provided [organizationName]
  /// and [projectName].
  ///
  /// This is the default fallback value for the application ID.
  factory LinuxApplicationId.fallback({
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

    return LinuxApplicationId(parts.join('.'));
  }
}
