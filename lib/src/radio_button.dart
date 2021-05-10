import 'package:flutter/material.dart';

import 'radio_button_text_position.dart';

class RadioButton<T> extends StatelessWidget {
  final String description;
  final T value;
  final T groupValue;
  final void Function(T?)? onChanged;
  final RadioButtonTextPosition textPosition;
  final Color? activeColor;

  const RadioButton({
    required this.description,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.textPosition = RadioButtonTextPosition.right,
    this.activeColor,
  });

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () {
          if (this.onChanged != null) {
            this.onChanged!(value);
          }
        },
        child: Row(
          mainAxisAlignment: this.textPosition == RadioButtonTextPosition.right
              ? MainAxisAlignment.start
              : MainAxisAlignment.end,
          children: <Widget>[
            this.textPosition == RadioButtonTextPosition.left
                ? Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      this.description,
                      textAlign: TextAlign.left,
                    ),
                  )
                : Container(),
            Radio<T>(
              groupValue: groupValue,
              onChanged: this.onChanged,
              value: this.value,
              activeColor: activeColor,
            ),
            this.textPosition == RadioButtonTextPosition.right
                ? Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Text(
                      this.description,
                      textAlign: TextAlign.right,
                    ),
                  )
                : Container(),
          ],
        ),
      );
}
