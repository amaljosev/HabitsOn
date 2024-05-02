// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'graph_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GraphModelAdapter extends TypeAdapter<GraphModel> {
  @override
  final int typeId = 3;

  @override
  GraphModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GraphModel(
      id: fields[0] as DateTime,
      sundayCount: fields[1] as double,
      mondayCount: fields[2] as double,
      tuesdayCount: fields[3] as double,
      wednesdayCount: fields[4] as double,
      thursdayCount: fields[5] as double,
      fridayCount: fields[6] as double,
      saturdayCount: fields[7] as double,
    );
  }

  @override
  void write(BinaryWriter writer, GraphModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.sundayCount)
      ..writeByte(2)
      ..write(obj.mondayCount)
      ..writeByte(3)
      ..write(obj.tuesdayCount)
      ..writeByte(4)
      ..write(obj.wednesdayCount)
      ..writeByte(5)
      ..write(obj.thursdayCount)
      ..writeByte(6)
      ..write(obj.fridayCount)
      ..writeByte(7)
      ..write(obj.saturdayCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GraphModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
