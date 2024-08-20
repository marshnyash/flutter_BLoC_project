import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/email_bloc.dart';
import '../bloc/email_events.dart';
import '../bloc/email_state.dart';

class ClearAllEmailsButton extends StatelessWidget {
  const ClearAllEmailsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EmailBloc, EmailState>(
      builder: (context, state) {
        if (state.emails.isNotEmpty) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () => context.read<EmailBloc>().add(ClearEmails()),
                child: const Text('Clear All Emails'),
              ),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
