import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mole_master/features/auth/presentation/bloc/auth_bloc.dart';

class UserContextService {
  /// Mendapatkan userId dari AuthBloc (reliable source)
  static String? getUserId(BuildContext context) {
    return context.read<AuthBloc>().state.user?.id;
  }
  
  /// Mendapatkan userId dengan error handling
  static String getRequiredUserId(BuildContext context) {
    final userId = getUserId(context);
    if (userId == null) {
      throw Exception('User not authenticated');
    }
    return userId;
  }
  
  /// Cek apakah user sudah login
  static bool isAuthenticated(BuildContext context) {
    return getUserId(context) != null;
  }
}