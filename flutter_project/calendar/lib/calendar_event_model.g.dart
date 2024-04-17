// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_event_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CalendarEventModelAdapter extends TypeAdapter<CalendarEventModel> {
  @override
  final int typeId = 1;

  @override
  CalendarEventModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CalendarEventModel(
      name: fields[0] as String,
      begin: fields[1] as DateTime,
      end: fields[2] as DateTime,
      eventColor: fields[3] as Color,
    );
  }

  @override
  void write(BinaryWriter writer, CalendarEventModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.begin)
      ..writeByte(2)
      ..write(obj.end)
      ..writeByte(3)
      ..write(obj.eventColor);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CalendarEventModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
