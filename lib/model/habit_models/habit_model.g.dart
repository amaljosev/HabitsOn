// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habit_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HabitModelAdapter extends TypeAdapter<HabitModel> {
  @override
  final int typeId = 1;

  @override
  HabitModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HabitModel(
      id: fields[0] as String,
      habitName: fields[1] as String,
      duration: fields[2] as int,
      selectedDays: (fields[3] as List).cast<String>(),
      goalCount: fields[4] as String,
      goalName: fields[5] as String,
      doItAt: fields[6] as int,
      streak: fields[7] as int,
      startedDate: fields[8] as DateTime,
      latestDate: fields[9] as DateTime,
      isComplete: fields[10] as bool,
      backgroundColorIndex: fields[11] as int,
    );
  }

  @override
  void write(BinaryWriter writer, HabitModel obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.habitName)
      ..writeByte(2)
      ..write(obj.duration)
      ..writeByte(3)
      ..write(obj.selectedDays)
      ..writeByte(4)
      ..write(obj.goalCount)
      ..writeByte(5)
      ..write(obj.goalName)
      ..writeByte(6)
      ..write(obj.doItAt)
      ..writeByte(7)
      ..write(obj.streak)
      ..writeByte(8)
      ..write(obj.startedDate)
      ..writeByte(9)
      ..write(obj.latestDate)
      ..writeByte(10)
      ..write(obj.isComplete)
      ..writeByte(11)
      ..write(obj.backgroundColorIndex);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HabitModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
