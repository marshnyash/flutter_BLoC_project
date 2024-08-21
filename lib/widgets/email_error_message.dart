import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_bloc/cubit/email_cubit.dart';

class EmailErrorMessage extends StatelessWidget {
  const EmailErrorMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EmailCubit, EmailState>(
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
