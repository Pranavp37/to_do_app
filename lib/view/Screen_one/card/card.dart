import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  final String title;
  final bool isChecked;
  final Function(bool?)? onCheckboxChanged;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const TaskCard({
    super.key,
    required this.title,
    required this.isChecked,
    this.onCheckboxChanged,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Checkbox(
            value: isChecked,
            onChanged: onCheckboxChanged,
          ),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                decoration:
                    isChecked ? TextDecoration.lineThrough : TextDecoration.none,
              ),
            ),
          ),
          IconButton(
            onPressed: onEdit,
            icon: Icon(Icons.edit, color: Colors.blue),
          ),
          IconButton(
            onPressed: onDelete,
            icon: Icon(Icons.delete, color: Colors.red),
          ),
        ],
      ),
    );
  }
}
