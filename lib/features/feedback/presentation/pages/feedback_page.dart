import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/validators.dart';
import '../../../../core/utils/snackbars.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../bloc/feedback_bloc.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({super.key});

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  final _form = GlobalKey<FormState>();
  final _title = TextEditingController();
  final _msg = TextEditingController();

  @override
  void dispose() {
    _title.dispose();
    _msg.dispose();
    super.dispose();
  }

  void _submit() {
    if (!(_form.currentState?.validate() ?? false)) return;
    final uid = context.read<AuthBloc>().state.user?.id;
    if (uid == null) return;

    context.read<FeedbackBloc>().add(
          FeedbackSubmitRequested(userId: uid, title: _title.text.trim(), message: _msg.text.trim()),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Feedback')),
      body: BlocListener<FeedbackBloc, FeedbackState>(
        listener: (context, state) {
          if (state.status == FeedbackStatus.success) {
            AppSnack.success(context, 'Feedback terkirim. Terima kasih!');
            _title.clear();
            _msg.clear();
          } else if (state.status == FeedbackStatus.failure) {
            AppSnack.error(context, state.message ?? 'Gagal mengirim feedback');
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _form,
            child: Column(
              children: [
                TextFormField(
                  controller: _title,
                  validator: Validators.requiredField,
                  decoration: const InputDecoration(labelText: 'Judul'),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _msg,
                  validator: Validators.requiredField,
                  maxLines: 6,
                  decoration: const InputDecoration(labelText: 'Pesan'),
                ),
                const SizedBox(height: 16),
                BlocBuilder<FeedbackBloc, FeedbackState>(
                  builder: (context, state) {
                    final loading = state.status == FeedbackStatus.loading;
                    return SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                        onPressed: loading ? null : _submit,
                        child: Text(loading ? 'Mengirim...' : 'Kirim'),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}