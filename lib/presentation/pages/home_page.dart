import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:test_to_do/core/constants/app_assets.dart';
import 'package:test_to_do/core/theme/theme_extensions.dart';
import 'package:test_to_do/presentation/bloc/todo_form_bloc.dart';
import 'package:test_to_do/presentation/bloc/todo_list_cubit.dart';
import 'package:test_to_do/presentation/controller/todo_form_controller.dart';
import 'package:test_to_do/presentation/controller/todo_form_provider.dart';
import 'package:test_to_do/presentation/pages/calendar_page.dart';
import 'package:test_to_do/presentation/pages/form_todo_body_view.dart';
import 'package:test_to_do/presentation/pages/statistics_tab_view.dart';
import 'package:test_to_do/presentation/widgets/live_date_time_title_widget.dart';
import 'package:test_to_do/presentation/widgets/form/segmented_tabs_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    initializeDateFormatting('ru');
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const LiveDateTimeTitleWidget(),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CalendarPage()),
              );
            },
            icon: SvgPicture.asset(
              AppAssets.iconCalendar,
              width: 20,
              height: 20,
              colorFilter: ColorFilter.mode(
                context.c.buttonTextDisabled,
                BlendMode.srcIn,
              ),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(27.5),
          child: SegmentedTabsWidget(controller: _tabController),
        ),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => TodoFormBloc()),
          BlocProvider(create: (_) => TodoListCubit()),
        ],
        child: TabBarView(
          controller: _tabController,
          children: [
            TodoFormProvider(
              notifier: TodoFormController(),
              child: const FormTodoBodyView(),
            ),
            const StatisticsTabView(),
          ],
        ),
      ),
    );
  }
}
