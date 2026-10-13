import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:portfolio/core/theme/app_theme.dart';
import 'package:portfolio/features/navigation/cubit/navigation_cubit.dart';
import 'package:portfolio/features/portfolio/presentation/portfolio_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NavigationCubit(),
      child: MaterialApp(
        title: 'Daniel Flores Ambrosio | Senior Flutter Developer & Mobile Architect',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.darkTheme,
        home: const PortfolioPage(),
      ),
    );
  }
}
