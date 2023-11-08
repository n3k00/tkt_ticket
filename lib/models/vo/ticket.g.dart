// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketVO _$TicketVOFromJson(Map<String, dynamic> json) => TicketVO(
      json['way'] as String,
      json['set'] as String,
      json['setNumber'] as String,
      json['name'] as String,
      json['phone'] as String,
      json['date'] as String,
      json['note'] as String,
      json['agent'] as String,
      json['timestamp'] as int?,
    );

Map<String, dynamic> _$TicketVOToJson(TicketVO instance) => <String, dynamic>{
      'way': instance.way,
      'set': instance.set,
      'setNumber': instance.setNumber,
      'name': instance.name,
      'phone': instance.phone,
      'date': instance.date,
      'note': instance.note,
      'agent': instance.agent,
      'timestamp': instance.timestamp,
    };
