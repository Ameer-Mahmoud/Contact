
import 'package:flutter/material.dart';

import '../models/contact_model.dart';
import '../utils/colors_asset.dart';
import '../utils/images_asset.dart';

class ContactsCard extends StatelessWidget {
  final Contact contact;
  final VoidCallback removeContact;

  const ContactsCard({
    super.key,
    required this.contact,
    required this.removeContact,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.gold,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadiusGeometry.only(
                    topRight: Radius.circular(16),
                    topLeft: Radius.circular(16),
                  ),
                  child: contact.image == null
                      ? Image.asset("assets/images/splash_Route.png",
                    fit: BoxFit.cover,
                    width: double.infinity,
                  )
                      : Image.file(
                    contact.image!,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.gold,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      contact.name,
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.darkBlue,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              spacing: 4,
              children: [
                Row(
                  spacing: 8,
                  children: [
                    Icon(Icons.email_rounded, color: AppColors.darkBlue),
                    Text(
                      contact.email,
                      style: TextStyle(
                        fontSize: 10,
                        color: AppColors.darkBlue,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Row(
                  spacing: 8,
                  children: [
                    Icon(Icons.phone_rounded, color: AppColors.darkBlue),
                    Text(
                      '+2${contact.phone}',
                      style: TextStyle(
                        fontSize: 10,
                        color: AppColors.darkBlue,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: removeContact,
                  style: ElevatedButton.styleFrom(
                    backgroundColor:Colors.red,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(8),
                    ),
                  ),
                  child: Row(
                    spacing: 8,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.delete_rounded),
                      Text(
                        'Delete',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}