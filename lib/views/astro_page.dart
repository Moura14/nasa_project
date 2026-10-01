import 'package:flutter/material.dart';

class AstroPage extends StatelessWidget {
  final List<Map<String, String>> fakeData = [
    {
      "image": "https://picsum.photos/200/300?random=1",
      "title": "Nebulosa Azul",
    },
    {
      "image": "https://picsum.photos/200/300?random=2",
      "title": "Galáxia Espiral",
    },
    {
      "image": "https://picsum.photos/200/300?random=3",
      "title": "Supernova Brilhante",
    },
    {
      "image": "https://picsum.photos/200/300?random=4",
      "title": "Planeta Vermelho",
    },
    {
      "image": "https://picsum.photos/200/300?random=5",
      "title": "Constelação Misteriosa",
    },
    {
      "image": "https://picsum.photos/200/300?random=6",
      "title": "Buraco Negro",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Imagens Astronômicas")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // duas colunas
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 0.7,
          ),
          itemCount: fakeData.length,
          itemBuilder: (context, index) {
            final item = fakeData[index];
            return Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                      child: Image.network(
                        item["image"]!,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      item["title"]!,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
