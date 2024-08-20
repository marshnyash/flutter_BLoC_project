import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/email_bloc.dart';
import '../bloc/email_events.dart';
import '../bloc/email_state.dart';

class EmailList extends StatelessWidget {
  const EmailList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EmailBloc, EmailState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (state.emails.isNotEmpty) const Text('Email List:'),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: state.emails
                  .map((email) => Chip(
                        label: Text(email),
                        onDeleted: () =>
                            context.read<EmailBloc>().add(RemoveEmail(email)),
                      ))
                  .toList(),
            ),
          ],
        );
      },
    );
  }
}
