import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'email_state.dart';

class EmailCubit extends Cubit<EmailState> {
  EmailCubit()
      : super(const EmailState(
            emails: [], errorMessage: '', isButtonEnabled: false));

  void emailChanged(String email) {
    final isValid = _isValidEmail(email);
    final currentEmails = state.emails;
    final hasDuplicate = currentEmails.contains(email);

    emit(state.copyWith(
      isButtonEnabled: isValid && !hasDuplicate,
      errorMessage:
          _getErrorMessage(email, isValid, hasDuplicate, currentEmails),
    ));
  }

  void addEmail(String email) {
    final updatedEmails = List<String>.from(state.emails)..add(email);
    emit(state.copyWith(
      emails: updatedEmails,
      errorMessage:
          updatedEmails.isEmpty ? 'At least 1 email should be added' : '',
      isButtonEnabled: false,
    ));
  }

  void removeEmail(String email) {
    final updatedEmails = List<String>.from(state.emails)..remove(email);
    emit(state.copyWith(
      emails: updatedEmails,
      errorMessage:
          updatedEmails.isEmpty ? 'At least 1 email should be added' : '',
      isButtonEnabled: false,
    ));
  }

  void clearEmails() {
    emit(state.copyWith(
      emails: [],
      errorMessage: 'At least 1 email should be added',
      isButtonEnabled: false,
    ));
  }

  final regex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');

  bool _isValidEmail(String email) => regex.hasMatch(email);

  String _getErrorMessage(
      String email, bool isValid, bool hasDuplicate, List<String> emails) {
    if (email.isEmpty) return 'Email cannot be empty';
    if (!isValid) return 'Invalid email address';
    if (hasDuplicate) return 'Email already added';
    if (emails.isEmpty) return 'At least 1 email should be added';
    return '';
  }
}
