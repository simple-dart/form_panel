import 'package:simple_dart_label/simple_dart_label.dart';
import 'package:simple_dart_ui_core/simple_dart_ui_core.dart';

class FormPanel extends PanelComponent {
  FormPanel() : super('FormPanel') {
    vertical = true;
  }

  List<Panel> rows = <Panel>[];

  void addComponent(String caption, Component component) {
    final label = Label()
      ..caption = caption
      ..width = _labelsWidth;
    final row = Panel()
      ..spacing = _formSpacing
      ..add(label)
      ..add(component);
    rows.add(row);
    add(row);
  }

  void addLabel(String caption, String labelCaption) {
    final label = Label()..caption = labelCaption;
    addComponent(caption, label);
  }

  String _formSpacing = '';
  String _labelsWidth = '';

  set formSpacing(String value) {
    _formSpacing = value;
    for (final row in rows) {
      row.spacing = _formSpacing;
    }
  }

  String get formSpacing => _formSpacing;

  set labelsWidth(String value) {
    _labelsWidth = value;
    for (final row in rows) {
      row.children.first.width = _labelsWidth;
    }
  }

  @override
  void clear() {
    rows.clear();
    super.clear();
  }

  String get labelsWidth => _labelsWidth;
}
