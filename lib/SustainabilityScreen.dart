import 'package:flutter/material.dart';

class SustainabilityScreen extends StatelessWidget {
  final Color primaryColor = Color(0xFF00FFC4);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sustentabilidade na África Central"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [primaryColor, Colors.teal],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            children: [
              SustainabilityCard(
                title: "Energia Renovável",
                description:
                    "Investimentos em energia solar e eólica estão crescendo.",
                icon: Icons.bolt,
                backgroundColor: Colors.orange, // Cor do card
              ),
              SustainabilityCard(
                title: "Conservação de Florestas",
                description:
                    "Projetos para proteger florestas tropicais e biodiversidade.",
                icon: Icons.nature,
                backgroundColor: Colors.green, // Cor do card
              ),
              SustainabilityCard(
                title: "Agricultura Sustentável",
                description:
                    "Métodos sustentáveis para melhorar a segurança alimentar.",
                icon: Icons.agriculture,
                backgroundColor: Colors.yellow, // Cor do card
              ),
              SustainabilityCard(
                title: "Educação Ambiental",
                description:
                    "Programas para aumentar a conscientização sobre sustentabilidade.",
                icon: Icons.school,
                backgroundColor: Colors.blue, // Cor do card
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SustainabilityCard extends StatefulWidget {
  final String title;
  final String description;
  final IconData icon;
  final Color backgroundColor;

  SustainabilityCard({
    required this.title,
    required this.description,
    required this.icon,
    required this.backgroundColor,
  });

  @override
  _SustainabilityCardState createState() => _SustainabilityCardState();
}

class _SustainabilityCardState extends State<SustainabilityCard> {
  double _elevation = 4.0;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _elevation = 10.0;
        });
      },
      onExit: (_) {
        setState(() {
          _elevation = 4.0;
        });
      },
      child: Material(
        elevation: _elevation,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          decoration: BoxDecoration(
            color: widget.backgroundColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  widget.icon,
                  size: 40,
                  color: Colors.white,
                ),
                SizedBox(height: 10),
                Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  widget.description,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
