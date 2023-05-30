import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class GroupsPage extends StatelessWidget {
  const GroupsPage({super.key});

  void showForm(BuildContext context) {
    Navigator.of(context).pushNamed('/groups/form');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To do List', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: const _GroupList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showForm(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _GroupList extends StatefulWidget {
  const _GroupList();

  @override
  State<_GroupList> createState() => __GroupListState();
}

class __GroupListState extends State<_GroupList> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return const Divider(height: 1);
        },
        separatorBuilder: (BuildContext context, int index) {
          return _GroupListRowWidget(indexList: index);
        },
        itemCount: 20);
  }
}

class _GroupListRowWidget extends StatelessWidget {
  final int indexList;
  const _GroupListRowWidget({required this.indexList});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      // The end action pane is the one at the right or the bottom side.
      endActionPane: const ActionPane(
        motion: BehindMotion(),
        children: [
          SlidableAction(
            onPressed: null,
            backgroundColor: Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      child: ListTile(
        title: const Text('ы'),
        tileColor: Colors.white,
        onTap: () {},
      ),
    );

    // The child of the Slidable is what the user sees when the
    // component is not dragged.
  }
}
