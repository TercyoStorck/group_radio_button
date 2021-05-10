import 'radio_button_text_position.dart';

class RadioButtonBuilder<T> {
  final String description;
  final RadioButtonTextPosition? textPosition;

  RadioButtonBuilder(
    this.description, {
    this.textPosition,
  });
}
