# Radio button group

Flutter librity to create radio groups and radio button with labels.

| [![](https://raw.githubusercontent.com/TercyoStorck/radio_button_group/master/assets/1.jpg)](http://videoblocks.com)  | [![](https://raw.githubusercontent.com/TercyoStorck/radio_button_group/master/assets/2.jpg)](http://audioblocks.com) | [![](https://raw.githubusercontent.com/TercyoStorck/radio_button_group/master/assets/3.jpg)](http://graphicstock.com) |
|:---:|:---:|:---:|

## RadioButton

``` dart
RadioButton(
  description: "Text alignment right",
  value: "Text alignment right",
  groupValue: _singleValue,
  onChanged: (value) => setState(
    () => _singleValue = value,
  ),
),
```

## RadioButtonGroup

``` dart
RadioGroup<String>.builder(
  groupValue: _verticalGroupValue,
  onChanged: (value) => setState(() {
    _verticalGroupValue = value;
  }),
  items: _status,
  itemBuilder: (item) => RadioButtonBuilder(
    item,
  ),
),
```