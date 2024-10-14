import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum DayTime {
  breakfast('Breakfast'),
  lunch('Lunch'),
  dinner('Dinner');

  final String value;
  const DayTime(this.value);
}

class CustomDropDown extends ConsumerWidget {
  const CustomDropDown({super.key, this.onChange, required this.selectedValue});
  final DayTime selectedValue;
  final void Function(DayTime?)? onChange;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DropdownButton<DayTime>(
      underline: Container(),
      elevation: 0,
      value: selectedValue,
      menuMaxHeight: 300,
      menuWidth: 120,
      isExpanded: true,
      icon: const Icon(Icons.keyboard_arrow_down),
      // dropdownColor: Colors.white,
      items: DayTime.values.map((DayTime value) {
        return DropdownMenuItem<DayTime>(
          value: value,
          child: Text(value.value),
        );
      }).toList(),
      onChanged: onChange,
    );
  }
}
