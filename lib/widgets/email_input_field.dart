import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_bloc/cubit/email_cubit.dart';

class EmailInputField extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  EmailInputField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EmailCubit, EmailState>(
      builder: (context, state) {
        return Row(
          children: [
            Expanded(
              child: TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  hintText: 'Enter email',
                  border: OutlineInputBorder(),
                ),
                onChanged: (email) => context.read<EmailCubit>().emailChanged(email),
              ),
            ),
            const SizedBox(width: 8),
            ElevatedButton(
              onPressed: state.isButtonEnabled
                  ? () {
                      context.read<EmailCubit>().addEmail(_controller.text);
                      _controller.clear();
                    }
                  : null,
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
