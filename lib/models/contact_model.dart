import 'dart:io';

class Contact {
  final String name;
  final String email;
  final String phone;
  final File? image;

  const Contact({
    required this.name,
    required this.email,
    required this.phone,
    this.image,
  });
}