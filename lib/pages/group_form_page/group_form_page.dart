import 'package:flutter/material.dart';
import 'package:to_do_list/pages/group_form_page/group_form_page_model.dart';

class GroupFromPage extends StatefulWidget {
  const GroupFromPage({super.key});

  @override
  State<GroupFromPage> createState() => _GroupFromPageState();
}

class _GroupFromPageState extends State<GroupFromPage> {
  final model = GroupFormWidgetModel();
  @override
  Widget build(BuildContext context) {
    return GroupFormPageModelProvider(
      model: model,
      child: const GroupFromPageBody(),
    );
  }
}

class _GroupNameWidget extends StatelessWidget {
  const _GroupNameWidget();

  @override
  Widget build(BuildContext context) {
    final model = GroupFormPageModelProvider.read(context)?.model;
    return TextField(
      onChanged: (value) => model?.groupName = value,
      onEditingComplete: () => model?.saveGroup(context),
      autofocus: true,
      decoration: const InputDecoration(border: OutlineInputBorder(), hintText: 'Имя группы'),
    );
  }
}

class GroupFromPageBody extends StatelessWidget {
  const GroupFromPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    final model = GroupFormPageModelProvider.read(context)?.model;
    return Scaffold(
      appBar: AppBar(title: const Text('Новая группа')),
      body: Center(
        child: Container(
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: _GroupNameWidget(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => model?.saveGroup(context),
        child: const Icon(Icons.done),
      ),
    );
  }
}
