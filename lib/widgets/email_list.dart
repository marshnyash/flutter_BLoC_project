import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_bloc/cubit/email_cubit.dart';

class EmailList extends StatelessWidget {
  const EmailList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EmailCubit, EmailState>(
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
                            context.read<EmailCubit>().removeEmail(email),
                      ))
                  .toList(),
            ),
          ],
        );
      },
    );
  }
}
