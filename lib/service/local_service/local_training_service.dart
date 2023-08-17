import 'package:flutter_application/model/training.dart';
import 'package:hive/hive.dart';

class LocalTrainingService {
  late Box<Training> _TrainingBox;

  Future<void> init() async {
    _TrainingBox = await Hive.openBox<Training>('Trainings');
  }

  Future<void> assignTrainings({required List<Training> trainings}) async {
    await _TrainingBox.clear();
    await _TrainingBox.addAll(trainings);
  }

  List<Training> getTrainings() => _TrainingBox.values.toList();
}
