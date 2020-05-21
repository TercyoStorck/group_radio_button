# Radio button group

Flutter libriry to create radio groups and radio button with labels.

| ![](https://raw.githubusercontent.com/TercyoStorck/group_radio_button/master/assets/1.jpg)  | ![](https://raw.githubusercontent.com/TercyoStorck/group_radio_button/master/assets/2.jpg) | ![](https://raw.githubusercontent.com/TercyoStorck/group_radio_button/master/assets/3.jpg) |
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