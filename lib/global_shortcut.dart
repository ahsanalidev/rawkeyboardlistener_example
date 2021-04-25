import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TestIntent extends Intent {
  TestIntent();
}

class GlobalShortcut extends StatelessWidget {
  GlobalShortcut({
    Key key,
    this.child,
    this.focusNode,
  }) : super(key: key);
  final Widget child;

  final FocusNode focusNode;

  void _onKeyHandler(RawKeyEvent keyEvent) {
    if (keyEvent.runtimeType.toString() == 'RawKeyDownEvent') {
      PhysicalKeyboardKey _currentKey = keyEvent.physicalKey;
      if (_currentKey == PhysicalKeyboardKey.escape) {
        print('escape called');
      } else if (_currentKey == PhysicalKeyboardKey.tab) {
        print('tab called');
      } else if (_currentKey == PhysicalKeyboardKey.enter) {
        print('Enter called');
      } else if (_currentKey == PhysicalKeyboardKey.arrowDown) {
        print('Arrow Down Called');
      } else if (_currentKey == PhysicalKeyboardKey.arrowUp) {
        print('Arrow UP Called');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      focusNode: focusNode,
      onKey: _onKeyHandler,
      autofocus: true,
      child: child,
    );
  }
}
