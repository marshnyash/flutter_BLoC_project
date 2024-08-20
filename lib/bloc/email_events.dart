import 'package:equatable/equatable.dart';

sealed class EmailEvent extends Equatable {
  const EmailEvent();

  @override
  List<Object> get props => [];
}

class AddEmail extends EmailEvent {
  final String email;

  const AddEmail(this.email);

  @override
  List<Object> get props => [email];
}

class RemoveEmail extends EmailEvent {
  final String email;

  const RemoveEmail(this.email);

  @override
  List<Object> get props => [email];
}

class ClearEmails extends EmailEvent {}

class ValidateEmail extends EmailEvent {
  final String email;

  const ValidateEmail(this.email);

  @override
  List<Object> get props => [email];
}
