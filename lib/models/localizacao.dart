import 'package:geolocator/geolocator.dart';

class Localizacao {
  double latitude = 0;
  double longitude = 0;
  String erro = "";

  Localizacao() {
    getPosicao();
  }

  getPosicao() async {
    try {
      Position posicao = await posicaoAtual();
      latitude = posicao.latitude;
      longitude = posicao.longitude;
    } catch (e) {
      erro = e.toString();
    }
  }

  Future<Position> posicaoAtual() async {
    LocationPermission permissao;

    bool ativado = await Geolocator.isLocationServiceEnabled();

    if  (!ativado) {
      return Future.error('Por favor, habilite a localização do dispositivo.');
    }

    permissao = await Geolocator.checkPermission();

    if (permissao == LocationPermission.denied) {
      permissao = await Geolocator.requestPermission();

      if (permissao == LocationPermission.denied) {
        return Future.error('É necessário autorizar o acesso à localização.');
      }
    }

    if (permissao == LocationPermission.deniedForever) {
      return Future.error('É necessário autorizar o acesso à localização.');
    }

    return await Geolocator.getCurrentPosition();
  }
}
