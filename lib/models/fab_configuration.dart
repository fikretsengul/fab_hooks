import 'package:equatable/equatable.dart';
import 'package:fab_hooks/models/android_application_id.dart';
import 'package:fab_hooks/models/android_namespace.dart';
import 'package:fab_hooks/models/apple_application_id.dart';
import 'package:fab_hooks/models/exceptions.dart';
import 'package:fab_hooks/models/linux_application_id.dart';
import 'package:fab_hooks/models/windows_application_id.dart';

/// As in your existing code, consolidated here to keep DRY.
class FabConfiguration extends Equatable {
  FabConfiguration({
    required this.projectName,
    required this.applicationName,
    required this.organizationName,
    required this.description,
    required this.androidApplicationId,
    required this.iOsApplicationId,
    required this.macOsApplicationId,
    required this.windowsApplicationId,
    required this.linuxApplicationId,
    required this.androidNamespace,
  });

  final String projectName;
  final String applicationName;
  final String organizationName;
  final String description;

  final AndroidApplicationId androidApplicationId;
  final AppleApplicationId iOsApplicationId;
  final AppleApplicationId macOsApplicationId;
  final WindowsApplicationId windowsApplicationId;
  final LinuxApplicationId linuxApplicationId;
  final AndroidNamespace androidNamespace;

  @override
  List<Object?> get props => <Object?>[
        projectName,
        applicationName,
        organizationName,
        description,
        androidApplicationId,
        iOsApplicationId,
        macOsApplicationId,
        windowsApplicationId,
        linuxApplicationId,
        androidNamespace,
      ];

  /// Factory method: pick values from [vars].
  FabConfiguration.fromVars(Map<String, dynamic> vars)
      : projectName = vars['project_name'] as String? ?? 'my_app',
        applicationName = vars['application_name'] as String? ?? 'My App',
        organizationName = vars['org_name'] as String? ?? 'com.example',
        description =
            vars['description'] as String? ?? 'An advanced flutter project built with Flutter Advanced Boilerplate.',
        androidApplicationId = _buildAndroidId(vars),
        iOsApplicationId = _buildIOsId(vars),
        macOsApplicationId = _buildMacOsId(vars),
        windowsApplicationId = _buildWindowsId(vars),
        linuxApplicationId = _buildLinuxId(vars),
        androidNamespace = AndroidNamespace.fromApplicationId(_buildAndroidId(vars)) {
    if (!androidApplicationId.isValid) {
      throw InvalidAndroidApplicationIdFormat(androidApplicationId);
    }
  }

  static AndroidApplicationId _buildAndroidId(Map<String, dynamic> vars) {
    final String applicationId = vars['application_id'] as String? ?? '';
    return applicationId.isNotEmpty
        ? AndroidApplicationId(applicationId)
        : AndroidApplicationId.fallback(
            organizationName: vars['org_name'] as String? ?? 'com.example',
            projectName: vars['project_name'] as String? ?? 'my_app',
            applicationName: vars['application_name'] as String? ?? 'My App',
          );
  }

  static AppleApplicationId _buildIOsId(Map<String, dynamic> vars) {
    final String applicationId = vars['application_id'] as String? ?? '';
    return applicationId.isNotEmpty
        ? AppleApplicationId(applicationId)
        : AppleApplicationId.fallback(
            organizationName: vars['org_name'] as String? ?? 'com.example',
            projectName: vars['project_name'] as String? ?? 'my_app',
            applicationName: vars['application_name'] as String? ?? 'My App',
          );
  }

  static AppleApplicationId _buildMacOsId(Map<String, dynamic> vars) {
    final String applicationId = vars['application_id'] as String? ?? '';
    return applicationId.isNotEmpty
        ? AppleApplicationId(applicationId)
        : AppleApplicationId.fallback(
            organizationName: vars['org_name'] as String? ?? 'com.example',
            projectName: vars['project_name'] as String? ?? 'my_app',
            applicationName: vars['application_name'] as String? ?? 'My App',
          );
  }

  static WindowsApplicationId _buildWindowsId(Map<String, dynamic> vars) {
    final String applicationId = vars['application_id'] as String? ?? '';
    return applicationId.isNotEmpty
        ? WindowsApplicationId(applicationId)
        : WindowsApplicationId.fallback(
            organizationName: vars['org_name'] as String? ?? 'com.example',
            projectName: vars['project_name'] as String? ?? 'my_app',
          );
  }

  static LinuxApplicationId _buildLinuxId(Map<String, dynamic> vars) {
    final String applicationId = vars['application_id'] as String? ?? '';
    return applicationId.isNotEmpty
        ? LinuxApplicationId(applicationId)
        : LinuxApplicationId.fallback(
            organizationName: vars['org_name'] as String? ?? 'com.example',
            projectName: vars['project_name'] as String? ?? 'my_app',
          );
  }
}
