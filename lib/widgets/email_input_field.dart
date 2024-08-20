import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/email_bloc.dart';
import '../bloc/email_events.dart';
import '../bloc/email_state.dart';

class EmailInputField extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  EmailInputField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EmailBloc, EmailState>(
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
                onChanged: (value) =>
                    context.read<EmailBloc>().add(ValidateEmail(value)),
              ),
            ),
            const SizedBox(width: 8),
            ElevatedButton(
              onPressed: state.isButtonEnabled
                  ? () {
                      context.read<EmailBloc>().add(AddEmail(_controller.text));
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
