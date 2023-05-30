import 'package:flutter/material.dart';

class GroupFormWidgetModel {
  void saveGroup(BuildContext context) {
    print(groupName);
  }

  var groupName = '';
}

class GroupFormPageModelProvider extends InheritedWidget {
  final GroupFormWidgetModel model;
  const GroupFormPageModelProvider({
    required this.model,
    super.key,
    required super.child,
  });

  static GroupFormPageModelProvider? watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<GroupFormPageModelProvider>();
  }

  static GroupFormPageModelProvider? read(BuildContext context) {
    final widget = context.getElementForInheritedWidgetOfExactType<GroupFormPageModelProvider>()?.widget;
    return widget is GroupFormPageModelProvider ? widget : null;
  }

  @override
  bool updateShouldNotify(GroupFormPageModelProvider oldWidget) {
    return true;
  }
}
