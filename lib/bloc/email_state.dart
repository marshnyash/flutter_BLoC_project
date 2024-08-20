import 'package:equatable/equatable.dart';

class EmailState extends Equatable {
  final List<String> emails;
  final String errorMessage;
  final bool isButtonEnabled;

  const EmailState({
    required this.emails,
    this.errorMessage = '',
    this.isButtonEnabled = false,
  });

  EmailState updateState({
    List<String>? emails,
    String? errorMessage,
    bool? isButtonEnabled,
  }) {
    return EmailState(
      emails: emails ?? this.emails,
      errorMessage: errorMessage ?? this.errorMessage,
      isButtonEnabled: isButtonEnabled ?? this.isButtonEnabled,
    );
  }

  @override
  List<Object> get props => [emails, errorMessage, isButtonEnabled];
}
