import 'package:flutter/material.dart';
import './dummy_dart.dart';

import './main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  final Function savefilters;
  final Map<String,bool>currentfilters;
  FiltersScreen(this.currentfilters,this.savefilters);


  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  initState(){
    _glutenFree=widget.currentfilters['gluten'];
    _lactoseFree=widget.currentfilters['lactose'];
    _vegan=widget.currentfilters['vegan'];
    _vegetarian=widget.currentfilters['vegetarian'];
    super.initState();
  }

  Widget _buildSwitchListTile(
      String title,
      String description,
      bool currentValue,
      Function updateValue,
      ) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(
        description,
      ),
      onChanged: updateValue,
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: [
          IconButton(icon: Icon(Icons.save), onPressed: () {
            final selectedfilters={
              'gluten':_glutenFree,
              'lactose':_lactoseFree,
              'vegan':_vegan,
              'vegetarian':_vegetarian,


            };

            widget.savefilters(selectedfilters);})
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection.',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchListTile(
                  'Gluten-free',
                  'Only include gluten-free meals.',
                  _glutenFree,
                      (newValue) {
                    setState(
                          () {
                        _glutenFree = newValue;
                      },
                    );
                  },
                ),
                _buildSwitchListTile(
                  'Lactose-free',
                  'Only include lactose-free meals.',
                  _lactoseFree,
                      (newValue) {
                    setState(
                          () {
                        _lactoseFree = newValue;
                      },
                    );
                  },
                ),
                _buildSwitchListTile(
                  'Vegetarian',
                  'Only include vegetarian meals.',
                  _vegetarian,
                      (newValue) {
                    setState(
                          () {
                        _vegetarian = newValue;
                      },
                    );
                  },
                ),
                _buildSwitchListTile(
                  'Vegan',
                  'Only include vegan meals.',
                  _vegan,
                      (newValue) {
                    setState(
                          () {
                        _vegan = newValue;
                      },
                    );
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
