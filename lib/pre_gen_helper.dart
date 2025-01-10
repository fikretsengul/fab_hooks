import 'package:clock/clock.dart';
import 'package:fab_hooks/models/fab_configuration.dart';

Map<String, dynamic> buildVars(Map<String, dynamic> originalVars) {
  final FabConfiguration configuration = FabConfiguration.fromVars(originalVars);

  return <String, dynamic>{
    'project_name': configuration.projectName,
    'application_name': configuration.applicationName,
    'org_name': configuration.organizationName,
    'description': configuration.description,
    'android_namespace': configuration.androidNamespace.value,
    'android_application_id': configuration.androidApplicationId.value,
    'ios_application_id': configuration.iOsApplicationId.value,
    'macos_application_id': configuration.macOsApplicationId.value,
    'windows_application_id': configuration.windowsApplicationId.value,
    'linux_application_id': configuration.linuxApplicationId.value,
    'current_year': clock.now().year.toString(),
  };
}
