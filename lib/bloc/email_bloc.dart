import 'package:flutter_bloc/flutter_bloc.dart';

import 'email_events.dart';
import 'email_state.dart';

class EmailBloc extends Bloc<EmailEvent, EmailState> {
  EmailBloc() : super(const EmailState(emails: [])) {
    on<AddEmail>(_onAddEmail);
    on<RemoveEmail>(_onRemoveEmail);
    on<ClearEmails>(_onClearEmails);
    on<ValidateEmail>(_onValidateEmail);
  }

  void _onAddEmail(AddEmail event, Emitter<EmailState> emit) {
    final emails = List<String>.from(state.emails);

    if (emails.contains(event.email)) {
      emit(state.copyWith(errorMessage: 'Duplicate email found'));
    } else {
      emails.add(event.email);
      emit(state.copyWith(
        emails: emails,
        errorMessage: '',
        isButtonEnabled: false,
      ));
    }
  }

  void _onRemoveEmail(RemoveEmail event, Emitter<EmailState> emit) {
    final emails = List<String>.from(state.emails)..remove(event.email);
    emit(state.copyWith(
      emails: emails,
      errorMessage: emails.isEmpty ? 'At least 1 email should be added' : '',
    ));
  }

  void _onClearEmails(ClearEmails event, Emitter<EmailState> emit) {
    emit(state.copyWith(
        emails: [], errorMessage: 'At least 1 email should be added'));
  }

  void _onValidateEmail(ValidateEmail event, Emitter<EmailState> emit) {
    final isValid = _validateEmail(event.email);
    emit(state.copyWith(
        // errorMessage: event.email.isNotEmpty && !isValid ? 'Invalid email address' : '',
        isButtonEnabled: isValid));
  }

  bool _validateEmail(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }
}
