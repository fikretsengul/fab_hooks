// ignore_for_file: cascade_invocations, document_ignores

import 'package:mason/mason.dart';

/// An App ID identifies your iOS/macOS app in a provisioning profile.
///
/// An App ID is a two-part string used to identify one or more apps from a
/// single development team. A period (.) separates its parts.
///
/// See also:
///
/// * [Register an App ID](https://developer.apple.com/help/account/manage-identifiers/register-an-app-id/)
/// * [Apple Documentation Archive](https://developer.apple.com/library/archive/documentation/General/Conceptual/DevPedia-CocoaCore/AppID.html)
extension type AppleApplicationId(String value) {
  /// Creates a new [AppleApplicationId] from the provided [organizationName]
  /// and [projectName].
  ///
  /// This is the default fallback value for the application ID.
  factory AppleApplicationId.fallback({
    required String organizationName,
    required String projectName,
    required String applicationName,
  }) {
    final List<String> parts = <String>[];
    for (final String part in organizationName.split('.')) {
      if (part.isEmpty) {
        continue;
      }
      parts.add(part.paramCase);
    }
    parts.add(projectName.paramCase);
    parts.add(applicationName.paramCase);

    return AppleApplicationId(parts.join('.'));
  }
}
