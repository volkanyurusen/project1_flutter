import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_project/auth/auth.dart';
import '../../../constants/constants.dart';
import '../../../auth/logic/blocs.dart';
import '../../../widgets/widget.dart';
import '../onboarding_widgets/onboarding_widgets.dart';

class LoginScreen extends StatelessWidget {
  final appColors = AppColors();
  final _formKey = GlobalKey<FormState>();
  static const String routeName = 'login_screen';

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text(''),
      ),

      /// This widget determines the edge of areas
      body: SingleChildScrollView(
        child: _loginForm(context),
      ),
      floatingActionButton: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return state.formSubmissionStatus is FormSubmitting
              ? const CircularProgressIndicator()
              : FloatingActionButton(
                  child: Icon(
                    Icons.play_arrow,
                    size: 50.0,
                    color: appColors.scaffoldBackgroundColor,
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<LoginBloc>().add(LoginSubmitted());
                    }
                    if (kDebugMode) {
                      print('Button has been clicked');
                    }
                  },
                );
        },
      ),
    );
  }

  /// With this Form widget we can access the form key which takes advantage of
  /// the state of that form. So it's going to go into each of the child widgets
  /// any of the children and anything that's going to be a form is going to be
  /// able to be validated. So it's going to check if everything is validated.
  /// That's why we're going to be using the form key at the top.
  Widget _loginForm(context) {
    return Form(
      key: _formKey,
      child: AppBody(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// CustomSizedBox widgets determined the distance between
            /// the visual widgets
            const CustomSizedBox(ratio: 0.015),

            /// This widgets creates a title of the page
            Text(
              'Log In',
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(fontWeight: FontWeight.normal),
            ),

            /// CustomSizedBox widgets determined the distance between
            /// the visual widgets
            const CustomSizedBox(ratio: 0.1),

            /// The title of its below Textfield
            Text('EMAIL ADDRESS',
                style: Theme.of(context).textTheme.headlineSmall),

            /// this widget is the textformfield widget form email text control
            _emailFormField(),

            /// CustomSizedBox widgets determined the distance between
            /// the visual widgets
            const CustomSizedBox(ratio: 0.05),

            /// The title of its below Textfield
            Text('PASSWORD', style: Theme.of(context).textTheme.headlineSmall),

            /// this widget is the textformfield widget form password text control
            _passwordFormField(),

            /// this widget will show/hide the password text
            SwitchListTile(
              value: false,
              onChanged: (bool value) {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _emailFormField() {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return TextFormField(
          keyboardType: TextInputType.name,
          maxLines: 1,
          cursorColor: appColors.textColor,
          obscureText: false,
          decoration: InputDecoration(
            // hintText: '123456abc!',
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: appColors.textColor),
            ),
          ),

          /// The value inside the validator is that entered into the textfield
          validator: (emailValue) =>
              state.isValidEmail ? null : 'Invalid email address',
          onChanged: (emailValue) => context.read<LoginBloc>().add(
                LoginEmailChangedEvent(email: emailValue),
              ),
        );
      },
    );
  }

  Widget _passwordFormField() {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return TextFormField(
          keyboardType: TextInputType.name,
          maxLines: 1,
          cursorColor: appColors.textColor,
          obscureText: true,
          decoration: InputDecoration(
            // hintText: '123456abc!',
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: appColors.textColor),
            ),
          ),

          /// The value inside the validator is that entered into the textfield
          validator: (passwordValuee) =>
              state.isValidPassword ? null : 'Password is too weak',
          onChanged: (passwordValuee) => context.read<LoginBloc>().add(
                LoginPasswordChangedEvent(password: passwordValuee),
              ),
        );
      },
    );
  }
}
