import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nasa/controllers/apod_controller.dart';

class AstroPage extends StatefulWidget {



  @override
  State<AstroPage> createState() => _AstroPageState();
}

class _AstroPageState extends State<AstroPage> {
 


  final controller = ApodController();
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _carregarDados();
  }

  void _carregarDados() async{
    await controller.buscarDados();
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Imagens Astronômicas do Dia")),
      body: _buildBody()
    );
  }


  Widget _buildBody(){
    if(controller.isLoading){
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if(controller.mensagemError.isNotEmpty){
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error_outline, color: Colors.red, size: 60),
              const SizedBox(height: 16),
              Text(
                controller.mensagemError,
                style: TextStyle(color: Colors.white, fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _carregarDados, 
                child: const Text('Tentar novamente'))
            ],
          ),
        ),
      );
    }

    if(controller.posts.isEmpty){
        return const Center(
          child: Text('Nenhuma publicação encontrada', style: TextStyle(color: Colors.white)),
        );
    }
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        childAspectRatio: 1.0
      ),
      itemCount: controller.posts.length,
      itemBuilder: (context, index){
        final apod = controller.posts[index];

        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                apod.hdurl, fit: BoxFit.cover, width: double.infinity,
                loadingBuilder: (context, child, loadingProgress){
                  if(loadingProgress == null) return child;
                  return BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                    child: Container(),
                  );
                },
                errorBuilder: (context, error, stackTrace){
                  return Container(
                    height: 200,
                    color: Colors.grey[900],
                    child: const Center(
                      child: Icon(Icons.broken_image, color: Colors.grey, size: 50),
                    ),
                  );
                },
                )
            ],
          ),
        );
      },
    );
  }
  


}


