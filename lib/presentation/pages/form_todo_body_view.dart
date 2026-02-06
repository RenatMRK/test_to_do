import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_to_do/core/constants/app_assets.dart';
import 'package:test_to_do/core/constants/app_strings.dart';
import 'package:test_to_do/core/theme/theme_extensions.dart';
import 'package:test_to_do/presentation/bloc/todo_form_bloc.dart';
import 'package:test_to_do/presentation/bloc/todo_form_event.dart';
import 'package:test_to_do/presentation/bloc/todo_form_state.dart';
import 'package:test_to_do/presentation/bloc/todo_list_cubit.dart';
import 'package:test_to_do/presentation/controller/todo_form_provider.dart';
import 'package:test_to_do/presentation/model/emotion.dart';
import 'package:test_to_do/presentation/widgets/form/app_button_widget.dart';
import 'package:test_to_do/presentation/widgets/form/emotion_grid_widget.dart';
import 'package:test_to_do/presentation/widgets/form/emotion_selector_widget.dart';
import 'package:test_to_do/presentation/widgets/form/input_widget.dart';
import 'package:test_to_do/presentation/widgets/form/slider_level_widget.dart';

class FormTodoBodyView extends StatefulWidget {
  const FormTodoBodyView({super.key});

  @override
  State<FormTodoBodyView> createState() => _FormTodoBodyViewState();
}

class _FormTodoBodyViewState extends State<FormTodoBodyView> {
  final List<Emotion> emotions = List.generate(
    AppStrings.emotions.length,
    (index) => Emotion(AppStrings.emotions[index], AppAssets.emotions[index]),
  );
  final List<String> selfFeelings = AppStrings.selfFeelings;


  void _showError(String message) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text(AppStrings.errorTitle),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(AppStrings.close, style: context.t.titleMedium),
          ),
        ],
      ),
    );
  }

  void _showLoading() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const Center(child: CircularProgressIndicator()),
    );
  }

  void _showSuccess() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text(AppStrings.successTitle),
        content: const Text(AppStrings.successMessage),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(AppStrings.ok, style: context.t.titleMedium),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = TodoFormProvider.watch(context);
    final hasEmotion = controller.selectedEmotion != null;
    return BlocListener<TodoFormBloc, TodoFormState>(
      listener: (context, state) {
        if (state is TodoFormLoading) {
          _showLoading();
        } else {
          Navigator.of(context).pop(); 
        }

        if (state is TodoFormSuccess) {
            context.read<TodoListCubit>().addTodo(state.data);

          controller.reset();
          _showSuccess();
        }

        if (state is TodoFormError) {
          _showError(state.message);
        }
      },
      child: ListView(
        padding: EdgeInsets.only(left: 20, right: 20, bottom: 40),
        children: [
          SizedBox(height: 30),
          Text(AppStrings.feelingQuestion, style: context.t.displayMedium),

          SizedBox(height: 20),
          EmotionSelectorWidget(
            emotions: emotions,
            selectedEmotion: controller.selectedEmotion,
          ),
          if (hasEmotion) ...[
            SizedBox(height: 20),
            EmotionGridWidget(
              selectedFeeling: controller.selectedFeeling,
              onFeelingSelected: (feeling) {
                TodoFormProvider.read(context).setFeeling(feeling);
              },
              feelings: selfFeelings,
            ),
          ],
          SizedBox(height: 30),
          Text(AppStrings.stressLevel, style: context.t.displayMedium),
          SizedBox(height: 20),
          SliderLevelWidget(
            title: AppStrings.stressLow,
            subTitle: AppStrings.stressHigh,

            isEnabled: hasEmotion,
            onChanged: (v) => TodoFormProvider.read(context).setStressLevel(v),
          ),
          SizedBox(height: 30),
          Text(AppStrings.selfWorth, style: context.t.displayMedium),
          SizedBox(height: 20),
          SliderLevelWidget(
            title: AppStrings.selfWorthHigh,
            subTitle: AppStrings.selfWorthLow,
            isEnabled: hasEmotion,
            onChanged: (v) =>
                TodoFormProvider.read(context).setSelfWorthLevel(v),
          ),
          SizedBox(height: 30),
          Text(AppStrings.notes, style: context.t.displayMedium),
          SizedBox(height: 20),
          InputWidget(
            onChanged: (text) => TodoFormProvider.read(context).setNote(text),
          ),
          SizedBox(height: 16),
          AppButtonWidget(
            title: AppStrings.save,
            onPressed: controller.isValid
                ? () {
                    final uiModel = controller.toUiModel();

                    context.read<TodoFormBloc>().add(TodoFormSubmit(uiModel));
                  }
                : null,
          ),
        ],
      ),
    );
  }
}
