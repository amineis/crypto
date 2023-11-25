import 'package:crypto/net/flutterfire.dart';
import 'package:flutter/material.dart';

class AddView extends StatefulWidget {
  const AddView({super.key});

  @override
  State<AddView> createState() => _AddViewState();
}

class _AddViewState extends State<AddView> {
  List<String> coins = ["bitcoin", "ethereum", "tether"];

  String dropValue = 'bitcoin';
  TextEditingController _amount = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Column(
          children: [
            DropdownButton(
                value: dropValue,
                items: coins.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    dropValue = value!;
                  });
                }),
            Container(
              width: MediaQuery.of(context).size.width / 1.3,
              child: TextFormField(
                controller: _amount,
                decoration: const InputDecoration(
                  labelText: 'Coin Amount',
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.4,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: MaterialButton(
                onPressed: () async {
                  await addCoin(dropValue, _amount.text);

                  Navigator.of(context).pop();
                },
                child: const Text("Add"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
