import 'package:flutter/material.dart';
import 'package:widgetbook_core/widgetbook_core.dart' as core;

import '../state/state.dart';

class WidgetbookShell extends StatelessWidget {
  const WidgetbookShell({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final state = WidgetbookState.of(context);

    return ColoredBox(
      color: Theme.of(context).colorScheme.surface,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          core.NavigationPanel(
            initialPath: state.path,
            directories: state.directories,
            onNodeSelected: (path, _) {
              WidgetbookState.of(context).updatePath(path);
            },
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 2,
              ),
              child: child,
            ),
          ),
          SizedBox(
            width: 400,
            child: core.SettingsPanel(
              settings: [
                if (state.addons != null) ...{
                  core.SettingsPanelData(
                    name: 'Properties',
                    settings: state.addons!
                        .map((addon) => addon.buildSetting(context))
                        .toList(),
                  ),
                },
                core.SettingsPanelData(
                  name: 'Knobs',
                  settings: state.knobs.values
                      .map((knob) => knob.build(context))
                      .toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}