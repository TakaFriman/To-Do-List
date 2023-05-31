import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:to_do_list/domain/entity/group.dart';

class GroupPageModel extends ChangeNotifier {
  var _groups = <Group>[];

  List<Group> get groups => _groups.toList();

  GroupPageModel() {
    _setup();
  }

  void showForm(BuildContext context) {
    Navigator.of(context).pushNamed('/groups/form');
  }

  void deleteGroup(int groupIndex) async {
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(GroupAdapter());
    }
    final box = await Hive.openBox<Group>('groups_box');
    await box.deleteAt(groupIndex);
  }

  void _readGroupsFromHive(Box<Group> box) {
    _groups = box.values.toList();
    notifyListeners();
  }

  void _setup() async {
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(GroupAdapter());
    }
    final box = await Hive.openBox<Group>('groups_box');
    _readGroupsFromHive(box);
    box.listenable().addListener(() => _readGroupsFromHive(box));
  }
}

class GroupPageModelProvider extends InheritedNotifier {
  final GroupPageModel model;
  const GroupPageModelProvider({
    required this.model,
    Key? key,
    required Widget child,
  }) : super(
          child: child,
          key: key,
          notifier: model,
        );

  static GroupPageModelProvider? watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<GroupPageModelProvider>();
  }

  static GroupPageModelProvider? read(BuildContext context) {
    final widget = context.getElementForInheritedWidgetOfExactType<GroupPageModelProvider>()?.widget;
    return widget is GroupPageModelProvider ? widget : null;
  }
}
