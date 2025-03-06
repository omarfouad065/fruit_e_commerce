import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_e_commerce/features/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:fruit_e_commerce/features/home/presentation/view/widgets/custom_bottom_navigation_bar.dart';
import 'package:fruit_e_commerce/features/home/presentation/view/widgets/main_view_body_bloc_consumer.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  static const routeName = 'home_view';

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int currentViewIndex = 0;

  void _onTabSelected(int index) {
    currentViewIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(),
      child: Scaffold(
        bottomNavigationBar: CustomBottomNavigationBar(
          onItemTapped: (index) {
            currentViewIndex = index;

            setState(() {});
          },
        ),
        body: SafeArea(
            child:
                MainViewBodyBlocConsumer(currentViewIndex: currentViewIndex)),
      ),
    );
  }
}
