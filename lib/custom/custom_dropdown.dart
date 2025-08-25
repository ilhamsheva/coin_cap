import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  final List<String> values;
  final String? selectedValue;
  final Function(String?)? onChanged;

  const CustomDropdown({
    super.key,
    required this.values,
    this.selectedValue,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedValue,
      items: values.map((value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: onChanged,
      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
      dropdownColor: const Color.fromRGBO(31, 122, 145, 1),
      underline: const SizedBox.shrink(),
      icon: const Icon(Icons.arrow_drop_down, color: Colors.white)
    );
  }
}
