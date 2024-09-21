import 'package:flutter/material.dart';

class CounterWidget extends StatelessWidget {
  const CounterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.remove),
        ),
        Text("{Quantity}"),
           IconButton(
          onPressed: () {},
          icon: Icon(Icons.add),
        ),
      ],
    );
  }
}
