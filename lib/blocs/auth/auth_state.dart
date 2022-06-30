// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

enum AuthenStatus {
  unknown,
  authenticated,
  unauthenticated,
}

class AuthState extends Equatable {
  final AuthenStatus authenStatus;
  final fbAuth.User? user;
  AuthState({
    required this.authenStatus,
    this.user,
  });
  factory AuthState.unknown() {
    return AuthState(authenStatus: AuthenStatus.unknown);
  }

  @override
  List<Object?> get props => [authenStatus, user];

  @override
  String toString() => 'AuthState(authenStatus: $authenStatus,user: $user)';

  AuthState copyWith({
    AuthenStatus? authenStatus,
    fbAuth.User? user,
  }) {
    return AuthState(
      authenStatus: authenStatus ?? this.authenStatus,
      user: user ?? this.user,
    );
  }
}
