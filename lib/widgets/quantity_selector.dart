import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuantitySelector extends StatelessWidget {
  final RxInt quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  QuantitySelector({required this.quantity, required this.onIncrement, required this.onDecrement});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onDecrement,
          child: Container(
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(Icons.remove, size: 18),
          ),
        ),
        SizedBox(width: 8),
        Obx(() => Text('${quantity.value}', style: TextStyle(fontWeight: FontWeight.w600))),
        SizedBox(width: 8),
        GestureDetector(
          onTap: onIncrement,
          child: Container(
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(Icons.add, size: 18),
          ),
        ),
      ],
    );
  }
}
