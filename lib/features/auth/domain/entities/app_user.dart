import 'package:equatable/equatable.dart';

class AppUser extends Equatable {
  const AppUser({
    required this.id,
    required this.name,
    required this.email,
    required this.pretestDone,
  });

  final String id;
  final String name;
  final String email;
  final bool pretestDone;

  @override
  List<Object?> get props => [id, name, email, pretestDone];

  AppUser copyWith({String? name, String? email, bool? pretestDone}) {
    return AppUser(
      id: id,
      name: name ?? this.name,
      email: email ?? this.email,
      pretestDone: pretestDone ?? this.pretestDone,
    );
  }
}