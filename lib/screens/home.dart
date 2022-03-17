import 'package:flutter/material.dart';

import '../components/card_button.dart';
import '../components/remove_button.dart';
import '../models/count_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _listElements = <CountModel>[];
  @override
  void initState() {
    super.initState();
    _generatedDefaultModels();
  }

  void _generatedDefaultModels() {
    for (int i = 0; i < _maxElementCount; i++) {
      _listElements.add(CountModel.defaultModel(i));
    }
  }

  void _iteratedElement(CountModel e) {
    setState(() {
      final newList = _listElements.map((e2) {
        if (e == e2) {
          return e2.iterate();
        } else {
          return e2;
        }
      }).toList();
      _listElements.clear();
      _listElements.addAll(newList);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildListElements(),
          _buildRemoveButton(),
        ],
      ),
    );
  }

  Widget _buildListElements() {
    return Expanded(
      child: Center(
        child: ListView(
          shrinkWrap: true,
          children: _cardGenerator(),
        ),
      ),
    );
  }

  List<Widget> _cardGenerator() {
    return _listElements.map((e) {
      return CardButton(
          countModel: e,
          onTap: () {
            _iteratedElement(e);
          });
    }).toList();
  }

  Widget _buildRemoveButton() {
    if (_listElements.isEmpty) {
      return const SizedBox.shrink();
    }
    return RemoveButton(
      onTap: () {
        if (_listElements.isNotEmpty) {
          setState(() {
            _listElements.remove(_listElements.first);
          });
        }
      },
    );
  }

  static const _maxElementCount = 3;
}
