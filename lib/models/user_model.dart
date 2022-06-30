// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String id;
  final String name;
  final String email;
  final String profileImage;
  final int point;
  final String rank;
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.profileImage,
    required this.point,
    required this.rank,
  });

  factory User.initialUser() {
    return User(
      id: '',
      name: '',
      email: '',
      profileImage: '',
      point: -1,
      rank: '',
    );
  }
  @override
  List<Object> get props {
    return [
      id,
      name,
      email,
      profileImage,
      point,
      rank,
    ];
  }

  @override
  String toString() {
    return 'User(id: $id, name: $name, email: $email, profileImage: $profileImage, point: $point, rank: $rank)';
  }
}
