// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analyse_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AnalyseModelAdapter extends TypeAdapter<AnalyseModel> {
  @override
  final int typeId = 2;

  @override
  AnalyseModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AnalyseModel(
      id: fields[0] as String,
      habitName: fields[1] as String,
      targetDays: fields[2] as int,
      completedDays: fields[3] as int,
      targetCategory: fields[4] as int,
      completedCategory: fields[5] as int,
      currentStreak: fields[6] as int,
      bestStreak: fields[7] as int,
    );
  }

  @override
  void write(BinaryWriter writer, AnalyseModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.habitName)
      ..writeByte(2)
      ..write(obj.targetDays)
      ..writeByte(3)
      ..write(obj.completedDays)
      ..writeByte(4)
      ..write(obj.targetCategory)
      ..writeByte(5)
      ..write(obj.completedCategory)
      ..writeByte(6)
      ..write(obj.currentStreak)
      ..writeByte(7)
      ..write(obj.bestStreak);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AnalyseModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
