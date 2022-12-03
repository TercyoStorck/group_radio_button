import 'package:flutter/material.dart';
import 'package:group_radio_button/group_radio_button.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _stackIndex = 0;

  String _singleValue = "Text alignment right";
  String _verticalGroupValue = "Pending";

  final _status = ["Pending", "Released", "Blocked"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Radio button group example",
        ),
      ),
      body: IndexedStack(
        index: _stackIndex,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RadioButton(
                description: "Text alignment right Text alignment right",
                value: "Text alignment right",
                groupValue: _singleValue,
                onChanged: (value) => setState(
                  () => _singleValue = value ?? '',
                ),
                activeColor: Colors.red,
                textStyle: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  color: Colors.red,
                ),
              ),
              RadioButton(
                description: "Text alignment left",
                value: "Text alignment left",
                groupValue: _singleValue,
                fillColor: Colors.amber,
                onChanged: (value) => setState(
                  () => _singleValue = value ?? '',
                ),
                textPosition: RadioButtonTextPosition.left,
              ),
            ],
          ),
          Column(
            children: <Widget>[
              RadioGroup<String>.builder(
                groupValue: _verticalGroupValue,
                onChanged: (value) => setState(() {
                  _verticalGroupValue = value ?? '';
                }),
                items: _status,
                itemBuilder: (item) => RadioButtonBuilder(
                  item,
                ),
                fillColor: Colors.purple,
              ),
              RadioGroup<String>.builder(
                groupValue: _verticalGroupValue,
                onChanged: (value) => setState(() {
                  _verticalGroupValue = value ?? '';
                }),
                items: _status,
                itemBuilder: (item) => RadioButtonBuilder(
                  item,
                  textPosition: RadioButtonTextPosition.left,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 50.0,
            child: RadioGroup<String>.builder(
              direction: Axis.horizontal,
              groupValue: _verticalGroupValue,
              horizontalAlignment: MainAxisAlignment.spaceAround,
              onChanged: (value) => setState(() {
                _verticalGroupValue = value ?? '';
              }),
              items: _status,
              textStyle: const TextStyle(
                fontSize: 15,
                color: Colors.blue,
              ),
              itemBuilder: (item) => RadioButtonBuilder(
                item,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            label: "Single",
            icon: Icon(
              Icons.radio_button_checked,
            ),
          ),
          BottomNavigationBarItem(
            label: "Vertical",
            icon: Icon(
              Icons.list,
            ),
          ),
          BottomNavigationBarItem(
            label: "Horizontal",
            icon: Icon(
              Icons.linear_scale,
            ),
          ),
        ],
        currentIndex: _stackIndex,
        onTap: (index) => setState(
          () => _stackIndex = index,
        ),
      ),
    );
  }
}
