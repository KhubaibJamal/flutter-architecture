import 'package:mason/mason.dart';

void run(HookContext context) {
  // TODO: add pre-generation logic.
  String className = context.vars['name'];

  print("CLASSNAME: " + className);

  final initialParamFileName = "${className.snakeCase}.dart";
  print("INITIAL PARAMS: " + initialParamFileName);

  context.vars = {
    ...context.vars,
    'initial_params_file_name': initialParamFileName,
  };
}
