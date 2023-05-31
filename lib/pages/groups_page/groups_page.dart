import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:to_do_list/pages/groups_page/group_page_model.dart';

class GroupsPage extends StatefulWidget {
  const GroupsPage({super.key});

  @override
  State<GroupsPage> createState() => _GroupsPageState();
}

class _GroupsPageState extends State<GroupsPage> {
  final model = GroupPageModel();
  @override
  Widget build(BuildContext context) {
    return GroupPageModelProvider(model: model, child: const GroupsPageBody());
  }
}

class GroupsPageBody extends StatelessWidget {
  const GroupsPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To do List', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: const _GroupList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => GroupPageModelProvider.read(context)?.model.showForm(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _GroupList extends StatelessWidget {
  const _GroupList();

  @override
  Widget build(BuildContext context) {
    final groupsCount = GroupPageModelProvider.watch(context)?.model.groups.length ?? 0;
    return ListView.separated(
      itemCount: groupsCount,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return _GroupListRowWidget(indexList: index);
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(height: 1);
      },
    );
  }
}

class _GroupListRowWidget extends StatelessWidget {
  const _GroupListRowWidget({required this.indexList});

  final int indexList;
  @override
  Widget build(BuildContext context) {
    final model = GroupPageModelProvider.read(context)!.model;
    final group = model.groups[indexList];
    return Slidable(
      // The end action pane is the one at the right or the bottom side.
      endActionPane: ActionPane(
        motion: const BehindMotion(),
        children: [
          SlidableAction(
            onPressed: (context) => model.deleteGroup(indexList),
            backgroundColor: const Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      child: ListTile(
        title: Text(group.name),
        tileColor: Colors.white,
        onTap: () {},
      ),
    );

    // The child of the Slidable is what the user sees when the
    // component is not dragged.
  }
}
