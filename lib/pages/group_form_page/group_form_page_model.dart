import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:to_do_list/domain/entity/group.dart';

class GroupFormWidgetModel {
  var groupName = '';
  void saveGroup(BuildContext context) async {
    if (groupName.isEmpty) return;
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(GroupAdapter());
    }
    final box = await Hive.openBox<Group>('groups_box');
    final group = Group(name: groupName);
    await box.add(group);
    // ignore: use_build_context_synchronously
    Navigator.of(context).pop();
  }
}

class GroupFormPageModelProvider extends InheritedWidget {
  final GroupFormWidgetModel model;
  const GroupFormPageModelProvider({
    required this.model,
    Key? key,
    required Widget child,
  }) : super(child: child, key: key);

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
