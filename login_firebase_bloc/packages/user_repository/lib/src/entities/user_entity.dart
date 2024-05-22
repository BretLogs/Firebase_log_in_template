import 'package:equatable/equatable.dart';

class MyUserEntity extends Equatable {
  const MyUserEntity({
    required this.userId,
    required this.email,
    required this.name,
  });
  final String userId;
  final String email;
  final String name;

  Map<String, Object?> toDocument() {
    return <String, Object?>{
      'userId': userId,
      'email': email,
      'name': name,
    };
  }

  static MyUserEntity fromDocument(Map<String, dynamic> document) {
    return MyUserEntity(
      userId: document['userId'],
      email: document['email'],
      name: document['name'],
    );
  }

  @override
  List<Object?> get props => <Object?>[userId, email, name];
}
