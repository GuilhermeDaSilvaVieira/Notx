import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notx/common/theme/app_pallete.dart';
import 'package:notx/common/theme/bloc/theme_bloc.dart';

class ThemeSwitch extends StatelessWidget {
  const ThemeSwitch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = context.select((ThemeBloc bloc) => bloc.state);

    return Padding(
      padding: const EdgeInsets.only(right: 24),
      child: BlocBuilder<ThemeBloc, bool>(
        builder: (context, state) {
          return IconButton(
            onPressed: () => context.read<ThemeBloc>().add(ThemeToggle()),
            icon: Icon(
              isDark ? Icons.light_mode : Icons.dark_mode,
              color: isDark ? AppPallete.darkPrimary : AppPallete.lightPrimary,
            ),
          );
        },
      ),
    );
  }
}
