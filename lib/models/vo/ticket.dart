import 'package:json_annotation/json_annotation.dart';

part 'ticket.g.dart';

@JsonSerializable()
class TicketVO {
  @JsonKey(name: 'way')
  String way;

  @JsonKey(name: 'set')
  String set;

  @JsonKey(name: 'setNumber')
  String setNumber;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'phone')
  String phone;

  @JsonKey(name: 'date')
  String date;

  @JsonKey(name: 'note')
  String note;

  @JsonKey(name: 'agent')
  String agent;

  TicketVO(this.way, this.set, this.setNumber, this.name, this.phone, this.date,
      this.note, this.agent);

  factory TicketVO.fromJson(Map<String, dynamic> json) =>
      _$TicketVOFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$TicketVOToJson(this);
}
