import 'dart:convert';
import 'package:redis/redis.dart';
import '../models/real_estate.dart';

class RealEstateService {
  final RedisConnection _connection = RedisConnection();
  late Command _command;
  final String redisServerUrl = 'your.redis.server.url';
  final int redisServerPort = 6379;

  Future<void> _connect() async {
    _command = await _connection.connect(redisServerUrl, redisServerPort);
  }

  Future<List<RealEstate>> getAllRealEstates() async {
    await _connect();
    List<RealEstate> realEstates = [];
    var keys = await _command.get('realEstate:*');

    for (var key in keys) {
      var realEstateJson = await _command.get(key);
      realEstates.add(RealEstate.fromJson(json.decode(realEstateJson)));
    }

    return realEstates;
  }

  Future<RealEstate> getRealEstateById(int id) async {
    await _connect();
    var realEstateJson = await _command.get('realEstate:$id');
    return RealEstate.fromJson(json.decode(realEstateJson));
  }

  Future<RealEstate> addRealEstate(RealEstate realEstate) async {
    await _connect();
    var id = DateTime.now()
        .millisecondsSinceEpoch; // Or another way to generate a unique ID
    realEstate = realEstate.copyWith(
        id: id); // Assuming you have a copyWith method to update the ID
    await _command.set('realEstate:$id', json.encode(realEstate.toJson()));
    return realEstate; // Return the added RealEstate object with the new ID
  }

  Future<RealEstate> updateRealEstate(RealEstate realEstate) async {
    await _connect();
    await _command.set(
        'realEstate:${realEstate.id}', json.encode(realEstate.toJson()));
    return realEstate; // Return the updated RealEstate object
  }

  Future<void> deleteRealEstate(int id) async {
    await _connect();
    await _command.send_object(['DEL' 'realEstate:$id']);
  }
}
