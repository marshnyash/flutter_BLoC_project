import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_bloc/cubit/email_cubit.dart';

import '../widgets/clear_all_emails_button.dart';
import '../widgets/email_error_message.dart';
import '../widgets/email_input_field.dart';
import '../widgets/email_list.dart';

class EmailListScreen extends StatelessWidget {
  const EmailListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EmailCubit(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Email List Manager')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              EmailInputField(),
              const SizedBox(height: 8),
              const EmailErrorMessage(),
              const SizedBox(height: 16),
              const EmailList(),
              const SizedBox(height: 16),
              const ClearAllEmailsButton(),
            ],
          ),
        ),
      ),
    );
  }
}
