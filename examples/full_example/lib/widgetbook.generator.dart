/// A complete example for Widgetbook generator approach
///
/// You can use @App and @UseCase annotation to generate directories
/// [Ref link]: https://docs.widgetbook.io/getting-started/complete-example
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'customs/custom_addon.dart';
import 'customs/custom_addon_advanced.dart';
import 'widgetbook.generator.directories.g.dart';

void main() {
  runApp(const WidgetbookApp());
}

@widgetbook.App()
class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      // Use the generated directories variable
      directories: directories,
      addons: [
        CustomAddon(
          customValue: 'Widgetbook',
          initialCustomValue: 'Hello',
        ),
        AdvancedCustomAddon(
          initialValue: AdvancedCustomAddonValue(
            stringValue: 'WidgetbookCustomAddon',
            doubleValue: 10.99,
            boolValue: true,
          ),
        ),
      ],
      appBuilder: (context, child) {
        return child;
      },
    );
  }
}