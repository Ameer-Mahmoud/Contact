
import 'package:flutter/material.dart';

import '../models/contact_model.dart';
import '../utils/colors_asset.dart';

class HomeActionButtons extends StatelessWidget {
  final VoidCallback addContact;
  final VoidCallback removeContact;
  final List<Contact> contacts;

  const HomeActionButtons({
    super.key,
    required this.addContact,
    required this.removeContact,
    required this.contacts,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      mainAxisSize: MainAxisSize.min,
      children: [
        Visibility(
          visible: contacts.isNotEmpty,
          child: FloatingActionButton(
            onPressed: removeContact,
            backgroundColor: Colors.red,
            child: Icon(Icons.delete_rounded, color: AppColors.gold),
          ),
        ),
        Visibility(
          visible: contacts.length < 6,
          child: FloatingActionButton(
            onPressed: addContact,
            backgroundColor: AppColors.gold,
            child: Icon(Icons.add_rounded, color: AppColors.darkBlue),
          ),
        ),
      ],
    );
  }
}