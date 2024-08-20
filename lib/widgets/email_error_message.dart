import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/email_bloc.dart';
import '../bloc/email_state.dart';

class EmailErrorMessage extends StatelessWidget {
  const EmailErrorMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EmailBloc, EmailState>(
      builder: (context, state) {
        if (state.errorMessage.isNotEmpty) {
          return Text(
            state.errorMessage,
            style: const TextStyle(color: Colors.red),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
