// To parse this JSON data, do
//
//     final eventosModel = eventosModelFromJson(jsonString);

import 'dart:convert';

EventosModel eventosModelFromJson(String str) =>
    EventosModel.fromJson(json.decode(str));

String eventosModelToJson(EventosModel data) => json.encode(data.toJson());

class EventosModel {
  EventosModel({
    this.id,
    this.nombre,
    this.descripcion,
    this.costo,
    this.imagenes,
    this.fecha,
    this.ubicacion,
  });

  String id;
  String nombre;
  String descripcion;
  String costo;
  String imagenes;
  String fecha;
  String ubicacion;

  factory EventosModel.fromJson(Map<String, dynamic> json) => EventosModel(
        id: json["id"],
        nombre: json["nombre"],
        descripcion: json["descripcion"],
        costo: json["costo"],
        imagenes: json["imagenes"],
        fecha: json["fecha"],
        ubicacion: json["ubicacion"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "descripcion": descripcion,
        "costo": costo,
        "imagenes": imagenes,
        "fecha": fecha,
        "ubicacion": ubicacion,
      };
}
