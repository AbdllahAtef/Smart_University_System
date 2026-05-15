import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

final tokenProvider = StateProvider<String?>((ref) => null);
final userIdProvider = Provider<int?>((ref) {
  final token = ref.watch(tokenProvider);

  if (token == null || token.isEmpty) return null;

  final decodedToken = JwtDecoder.decode(token);

  final id =
      decodedToken['http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier'];

  return int.tryParse(id.toString());
});
final userRoleProvider = Provider<String?>((ref) {
  final token = ref.watch(tokenProvider);

  if (token == null || token.isEmpty) return null;

  final decodedToken = JwtDecoder.decode(token);

  final role =
      decodedToken['role'] ??
      decodedToken['http://schemas.microsoft.com/ws/2008/06/identity/claims/role'];

  return role?.toString().toLowerCase();
});


