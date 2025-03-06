part of 'signup_cubit.dart';

class SignupState {}

class SignupInitial extends SignupState {}

class SignupLoading extends SignupState {}

class SignupSuccess extends SignupState {
  final UserEntity userEntity;

  SignupSuccess({required this.userEntity});
}

final class SignupFailure extends SignupState {
  final String message;
  SignupFailure({required this.message});
}
