import 'package:conversor/app/models/currency_model.dart';
import 'package:flutter/material.dart';

class CurrencyBox extends StatelessWidget {

  final List<CurrencyModel> items;
  final CurrencyModel selectedItem;
  final TextEditingController controller;
  final void Function(CurrencyModel model) onChange;

  const CurrencyBox({Key key, this.items, this.controller, this.onChange, this.selectedItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            child: SizedBox(
          height: 56.6,
          child: DropdownButton<CurrencyModel>(
            iconEnabledColor: Colors.green[300],
              isExpanded: true,
              value: selectedItem,
              underline: Container(
                height: 1,
                color: Colors.green[300],
              ),
              items: items
              .map((e) => DropdownMenuItem(
                value: e,
                child: Text(e.name)))
              .toList(),
              onChanged: onChange,
            ),
          )
        ),
        SizedBox(width: 10),
        Expanded(
          flex: 2,
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.green[300]),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.green[300]),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
