import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:surya_learning_dart/models/app_user.dart';
import 'package:surya_learning_dart/services/auth_service.dart';
import 'package:surya_learning_dart/theme/app_spacing.dart';
import 'package:surya_learning_dart/utils/validators.dart';
import 'package:surya_learning_dart/widgets/primary-button.dart';

/// Form for updating the signed-in user's profile details.
class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key, this.user});

  final AppUser? user;

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  late final AppUser _user = widget.user ?? authService.currentUser;
  late final TextEditingController _nameController = TextEditingController(
    text: _user.name,
  );
  late final TextEditingController _emailController = TextEditingController(
    text: _user.email,
  );
  late final TextEditingController _phoneController = TextEditingController(
    text: _user.phone,
  );
  late final TextEditingController _bioController = TextEditingController(
    text: _user.bio,
  );

  bool _saving = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _saving = true);

    authService.updateProfile(
      name: _nameController.text,
      email: _emailController.text,
      phone: _phoneController.text.trim(),
      bio: _bioController.text.trim(),
    );

    await Future<void>.delayed(const Duration(milliseconds: 200));
    if (!mounted) return;

    setState(() => _saving = false);
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(const SnackBar(content: Text('Profile updated.')));
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit profile')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(AppSpacing.md),
          children: [
            TextFormField(
              controller: _nameController,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                labelText: 'Full name',
                prefixIcon: Icon(Icons.person_outline),
                border: OutlineInputBorder(),
              ),
              validator: Validators.name,
            ),
            const SizedBox(height: AppSpacing.md),
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                labelText: 'Email address',
                prefixIcon: Icon(Icons.mail_outline),
                border: OutlineInputBorder(),
              ),
              validator: Validators.email,
            ),
            const SizedBox(height: AppSpacing.md),
            TextFormField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                labelText: 'Phone (optional)',
                prefixIcon: Icon(Icons.phone_outlined),
                border: OutlineInputBorder(),
              ),
              validator: Validators.phone,
            ),
            const SizedBox(height: AppSpacing.md),
            TextFormField(
              controller: _bioController,
              maxLines: 4,
              maxLength: 160,
              textInputAction: TextInputAction.newline,
              decoration: const InputDecoration(
                labelText: 'Bio (optional)',
                alignLabelWithHint: true,
                prefixIcon: Icon(Icons.notes_outlined),
                border: OutlineInputBorder(),
              ),
              validator: Validators.bio,
            ),
            const SizedBox(height: AppSpacing.lg),
            PrimaryButton(
              label: 'Save changes',
              onPressed: _save,
              isLoading: _saving,
            ),
            const SizedBox(height: AppSpacing.lg),
          ],
        ),
      ),
    );
  }
}
