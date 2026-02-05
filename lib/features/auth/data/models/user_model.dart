import '../../domain/entities/app_user.dart';

class UserModel extends AppUser {
  const UserModel({
    required super.id,
    required super.name,
    required super.email,
    required super.pretestDone,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'pretest_done': pretestDone,
      };

  factory UserModel.fromJson(String id, Map<String, dynamic> json) {
    return UserModel(
      id: id,
      name: (json['name'] as String?) ?? '-',
      email: (json['email'] as String?) ?? '-',
      pretestDone: (json['pretest_done'] as bool?) ?? false,
    );
  }

  factory UserModel.fromEntity(AppUser u) => UserModel(
        id: u.id,
        name: u.name,
        email: u.email,
        pretestDone: u.pretestDone,
      );
}