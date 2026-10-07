import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nasa/models/apod_model.dart';

class ApodController {

  List<ApodModel> posts = [];
  bool isLoading = false;
  String mensagemError = '';



  Future<void> buscarDados() async{
    isLoading = true;
    mensagemError = '';

    try{
      final url = Uri.parse('https://science.nasa.gov/wp-json/wp/v2/apod-basic');
      final response = await http.get(url);

      if(response.statusCode == 200){
        final List<dynamic> listaJson = jsonDecode(response.body);

        posts = listaJson.map((json) => ApodModel.fromJson(json)).toList();
      }else{
        mensagemError = "Erro no servidor: Código ${response.statusCode}";
      }
    }catch(e){
      mensagemError = "Falha ao processar ou conectar dados";
    }finally{
      isLoading = false;
    }

  }




}