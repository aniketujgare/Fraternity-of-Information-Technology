import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/constants.dart';

class FitDropDownMenu extends StatefulWidget {
  final List<String> items;
  final String label;
  final IconData icon;
  final TextEditingController selectedValue;
  const FitDropDownMenu({
    super.key,
    required this.items,
    required this.label,
    required this.icon,
    required this.selectedValue,
  });

  @override
  State<FitDropDownMenu> createState() => _FitDropDownMenuState();
}

class _FitDropDownMenuState extends State<FitDropDownMenu> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        enableFeedback: true,
        selectedItemBuilder: (context) {
          return [
            for (int i = 0; i < widget.items.length; i++)
              Row(
                children: [
                  Icon(
                    widget.icon,
                    size: 22,
                    color: kTextFieldContentColor,
                  ),
                  const SizedBox(
                    width: 11,
                  ),
                  Expanded(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.items[i],
                        style: const TextStyle(
                          fontSize: 16,
                          // fontWeight: FontWeight.bold,
                          color: kPrimaryColor,
                        ),
                        // overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                ],
              ),
          ];
        },
        isExpanded: true,
        hint: Row(
          children: [
            Icon(
              widget.icon,
              size: 22,
              color: kTextFieldContentColor,
            ),
            const SizedBox(
              width: 9,
            ),
            Expanded(
              child: Text(
                widget.label,
                style: const TextStyle(
                  color: kTextFieldContentColor,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        items: widget.items
            .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ))
            .toList(),
        value: widget.selectedValue.text == 'null'
            ? null
            : widget.selectedValue.text,
        onChanged: (value) {
          setState(() {
            widget.selectedValue.text = value as String;
          });
        },
        buttonStyleData: ButtonStyleData(
          height: 60,
          width: (kWidth(context) * 0.5) - 40,
          padding: const EdgeInsets.only(left: 14, right: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: kTextFieldBorderColor,
            ),
            color: kTextFieldFillColor,
          ),
          elevation: 0,
        ),
        iconStyleData: const IconStyleData(
          icon: Icon(
            Icons.keyboard_arrow_down,
            size: 20,
          ),
          iconSize: 14,
          iconEnabledColor: kTextFieldContentColor,
          iconDisabledColor: kPrimaryColor,
        ),
        dropdownStyleData: DropdownStyleData(
          maxHeight: 200,
          width: 200,
          padding: null,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: kPrimaryColor,
          ),
          elevation: 8,
          offset: const Offset(-20, 0),
          scrollbarTheme: ScrollbarThemeData(
            radius: const Radius.circular(40),
            thickness: MaterialStateProperty.all<double>(4),
            thumbVisibility: MaterialStateProperty.all<bool>(true),
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: 40,
          padding: EdgeInsets.only(left: 14, right: 14),
        ),
      ),
    );
  }
}
