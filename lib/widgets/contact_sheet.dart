//import 'package:contact/utils/colors_asset.dart';
import 'dart:io';

import 'package:contact/models/contact_model.dart';
import 'package:contact/utils/app_validator.dart';
import 'package:contact/utils/colors_asset.dart';
import 'package:contact/widgets/custom_text_field.dart';
import 'package:contact/widgets/sheet_header.dart';
import 'package:flutter/material.dart';


class ContactSheet extends StatefulWidget {
  final List<Contact> contacts;
  final Function onUserAdded;
  const ContactSheet({super.key, required this.contacts,
    required this.onUserAdded});

  @override
  State<ContactSheet> createState() => _ContactSheetState();
}

class _ContactSheetState extends State<ContactSheet> {
final TextEditingController namecontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController phonecontroller = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final ValueNotifier<File?> pickedImage = ValueNotifier(null);
  @override
  void dispose() {
    super.dispose();
    namecontroller.dispose();
    emailcontroller.dispose();
    phonecontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 16,
        children: [
          SheetHeader(
            nameController: namecontroller
          ,emailController: emailcontroller,
            phoneController: phonecontroller,
          pickedImage: pickedImage,),

          Form(
            key: formKey,
            child: Column(spacing: 8,
              children: [
                CustomTextField(controller: namecontroller,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    hintText: "Enter User Name ",
                validator: (name)=> AppValidator.nameValidator(name),),
                CustomTextField(controller: emailcontroller,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    hintText: "Enter User Email  ",
                    validator: (email)=> AppValidator.nameValidator(email)),
                CustomTextField(controller: phonecontroller,
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.next,
                    hintText: "Enter User Phone ",
                    validator: (phone)=> AppValidator.nameValidator(phone)),
              ],


            ),
          ),
          ElevatedButton(onPressed: (){
            if(formKey.currentState!.validate()){
              widget.contacts.add(
                Contact(name: namecontroller.text,
                    email: emailcontroller.text,
                    phone: phonecontroller.text,
                image: pickedImage.value)
              );
              widget.onUserAdded();
              Navigator.pop(context);
            }
          },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.gold,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(16),
              ),
              minimumSize: Size.fromHeight(56),
            ),
              child: Text("Enter user",style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: AppColors.darkBlue
              ),
              ),


          )


        ],
      ),
    );
  }
}
