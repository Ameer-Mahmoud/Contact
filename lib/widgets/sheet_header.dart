import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';

import '../utils/colors_asset.dart';

class SheetHeader extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController ;
  final TextEditingController phoneController ;
  final ValueNotifier<File?> pickedImage;
  const SheetHeader({super.key, required this.nameController,
    required this.emailController,
    required this.phoneController, required this.pickedImage});

  @override
  Widget build(BuildContext context) {
    return  Row(

      children: [
        Expanded(flex: 35,
          child: GestureDetector(
            onTap: ()async{
              final ImagePicker picker = ImagePicker();
              final XFile? image = await picker.pickImage(source
                  : ImageSource.gallery);
              if(image != null){
                pickedImage.value = File(image.path);

              }
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.gold,width: 1),
              ),
              child: ValueListenableBuilder(
                valueListenable: pickedImage,
                  builder: (BuildContext context, image, Widget? child) {
                  if(image != null){
                    return AspectRatio(
                      aspectRatio: 1,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.file(image,fit: BoxFit.cover,)));
                  }else{
                    return Lottie.asset('assets/animations/Image Not Preview.json');
                  }
                  },
                   ),
            ),
          ),
        ),
        SizedBox( width: 10,),
        Expanded(flex: 65,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                ValueListenableBuilder(
                  valueListenable: nameController,
                  builder: (BuildContext context, name, Widget? child) {
                    return Text(name.text.isEmpty? "User Name":name.text
                      ,style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.gold,
                    ),
                    );
                  },
                ),
                Divider(color: AppColors.gold,),
                ValueListenableBuilder(
                  valueListenable: emailController,
                  builder: (BuildContext context, email, Widget? child) {
                    return Text(email.text.isEmpty?"example@email.com":email.text,
                      style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.gold,
                    ),
                    );
                  },

                ),
                Divider(color: AppColors.gold,),
                ValueListenableBuilder(
                  valueListenable: phoneController,
                  builder: (BuildContext context, phone, Widget? child) {
                    return Text(phone.text.isEmpty?"+200000000000":phone.text
                      ,style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.gold,
                    ),
                    );
                  },
                ),
              ],
            ))
      ],
    );
  }
}
