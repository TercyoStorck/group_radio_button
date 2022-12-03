import 'package:flutter/material.dart';

import 'radio_button.dart';
import 'radio_button_builder.dart';
import 'radio_button_text_position.dart';

class RadioGroup<T> extends StatelessWidget {
  /// Creates a [RadioButton] group
  ///
  /// The [groupValue] is the selected value.
  /// The [items] are elements to contruct the group
  /// [onChanged] will called every time a radio is selected. The clouser return the selected item.
  /// [direction] most be horizontal or vertial.
  /// and represent the space between elements
  /// [horizontalAlignment] works only when [direction] is [Axis.horizontal] and ignored when [Axis.vertical].
  final T groupValue;
  final List<T> items;
  final RadioButtonBuilder Function(T value) itemBuilder;
  final void Function(T?)? onChanged;
  final Axis direction;
  final MainAxisAlignment horizontalAlignment;
  final Color? activeColor;
  final Color? fillColor;
  final TextStyle? textStyle;

  const RadioGroup.builder({
    required this.groupValue,
    required this.onChanged,
    required this.items,
    required this.itemBuilder,
    this.direction = Axis.vertical,
    this.horizontalAlignment = MainAxisAlignment.spaceBetween,
    this.activeColor,
    this.fillColor,
    this.textStyle,
  });

  List<Widget> get _group => this.items.map(
        (item) {
          final radioButtonBuilder = this.itemBuilder(item);

          if (this.direction == Axis.vertical) {
            return Padding(
              padding: const EdgeInsets.all(1.0),
              child: RadioButton(
                description: radioButtonBuilder.description,
                value: item,
                groupValue: this.groupValue,
                onChanged: this.onChanged,
                textStyle: textStyle,
                textPosition: radioButtonBuilder.textPosition ?? RadioButtonTextPosition.right,
                activeColor: activeColor,
                fillColor: this.fillColor,
              ),
            );
          }

          return Expanded(
            child: RadioButton(
              description: radioButtonBuilder.description,
              value: item,
              groupValue: this.groupValue,
              onChanged: this.onChanged,
              textStyle: textStyle,
              textPosition: radioButtonBuilder.textPosition ?? RadioButtonTextPosition.right,
              activeColor: activeColor,
              fillColor: this.fillColor,
            ),
          );
        },
      ).toList();

  @override
  Widget build(BuildContext context) {
    if (this.direction == Axis.vertical) {
      return Column(
        children: _group,
      );
    }

    return Row(
      mainAxisAlignment: this.horizontalAlignment,
      children: _group,
    );
  }
}
