part of './login_view.dart';

class _LoginButton extends StatelessWidget {
  const _LoginButton({
    Key? key,
    required String loginText,
    required GlobalKey<FormState> formLoginKey,
    required TextEditingController emailController,
    required TextEditingController passwordController,
  })  : _loginText = loginText,
        _formLoginKey = formLoginKey,
        _emailController = emailController,
        _passwordController = passwordController,
        super(key: key);

  final String _loginText;
  final GlobalKey<FormState> _formLoginKey;
  final TextEditingController _emailController;
  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.isCompleted) {
          context.navigateToPage(const ImageLearn202());
        }
      },
      builder: (context, state) {
        return BlocBuilder<LoginCubit, LoginState>(
          builder: (context, state) {
            return Column(
              children: [
                ElevatedButton(
                  child: BlocBuilder<LoginCubit, LoginState>(
                    builder: (context, state) {
                      return state.isLoading ? const CircularProgressIndicator() : Text(_loginText);
                    },
                  ),
                  onPressed: () {
                    if (_formLoginKey.currentState?.validate() ?? false) {
                      context.read<LoginCubit>().checkUser(_emailController.text, _passwordController.text);
                    }
                  },
                ),
                Center(
                  child: Text('Hoşgeliniz ${state.loginModel?.email ?? ''}'),
                )
              ],
            );
          },
        );
      },
    );
  }
}

class _LoginAndPasswordWidgets extends StatelessWidget {
  const _LoginAndPasswordWidgets({
    Key? key,
    required TextEditingController emailController,
    required TextEditingController passwordController,
  })  : _emailController = emailController,
        _passwordController = passwordController,
        super(key: key);

  final TextEditingController _emailController;
  final TextEditingController _passwordController;
  @override
  Widget build(BuildContext context) {
    return BlocSelector<LoginCubit, LoginState, bool>(
      selector: (state) {
        return state.isLoading;
      },
      builder: (context, state) {
        return AnimatedOpacity(
          duration: context.durationNormal,
          opacity: state ? 0 : 1,
          child: Column(
            children: [
              Padding(
                padding: const PagePadding.bottom(),
                child: TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'e-mail'),
                  validator: (String? data) => (data?.isValidEmail ?? false) ? null : 'Geçersiz E-Mail',
                ),
              ),
              Padding(
                padding: const PagePadding.bottom(),
                child: TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'password'),
                  validator: (String? data) => ((data?.length ?? 0) > 6) ? null : 'Geçersiz şifre',
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
