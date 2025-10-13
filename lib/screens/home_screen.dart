import 'package:contact/models/contact_model.dart';
import 'package:contact/utils/colors_asset.dart';
import 'package:contact/utils/images_asset.dart';
import 'package:contact/widgets/contact_sheet.dart';
import 'package:contact/widgets/empty_widgets.dart';
import 'package:contact/widgets/home_buttons.dart';
import 'package:flutter/material.dart';

import '../widgets/contact_card.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "home";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {
  final List<Contact> contacts= [];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xff29384D),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              AppImages.logo,
              height: 39,
            ),
          ],
        ),
      ),
      body:contacts.isEmpty
       ? EmptyWidgets()
      : GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: contacts.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: .65,),
          itemBuilder: (context, index) {
            return ContactsCard(
              contact: contacts[index],
              removeContact: () => _removeContact(index),
            );
          },),
      floatingActionButton: HomeActionButtons(addContact: OpenModalBottomSheet,
          removeContact: _removeLastContact, contacts: contacts)


    );
  }
  void _removeContact(int index) {
    contacts.removeAt(index);
    setState(() {});
  }

  void _removeLastContact() {
    contacts.removeLast();
    setState(() {});
  }

  void OpenModalBottomSheet(){
    showModalBottomSheet(context: context,
        backgroundColor: AppColors.darkBlue,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(borderRadius:
        BorderRadiusGeometry.only(topRight: Radius.circular(40),
            topLeft:  Radius.circular(40)),
        ),

        builder: (context) {

      return Padding(
        padding:  EdgeInsets.only(bottom:MediaQuery.viewInsetsOf(context).bottom),
        child: ContactSheet(contacts: contacts,
          onUserAdded:(){
          setState(() {

          });
          },),
      );

    },);
  }
}
