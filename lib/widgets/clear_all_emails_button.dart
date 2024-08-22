import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_bloc/cubit/email_cubit.dart';



class ClearAllEmailsButton extends StatelessWidget {
  const ClearAllEmailsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EmailCubit, EmailState>(
      builder: (context, state) {
        if (state.emails.isNotEmpty) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () => context.read<EmailCubit>().clearEmails(),
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
