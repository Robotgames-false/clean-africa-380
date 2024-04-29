import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'SustainabilityScreen.dart';
import 'lixo.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 238, 255), // Cor de fundo neutra
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Sustentabilidade na África',
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Vamos explorar os desafios de sustentabilidade na África e as soluções inovadoras sendo aplicadas.',
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    fontSize: 18,
                    color: Colors.black54,
                  ),
                ),
              ),
              SizedBox(height: 40),
              HoverButton(
                text: 'Problemas de Lixo',
                color: Colors.green,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => lixos(),
                    ),
                  );
                },
              ),
              SizedBox(height: 20),
              HoverButton(
                text: 'Setores de Sustentabilidade na África Central',
                color: Colors.cyan,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SustainabilityScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HoverButton extends StatefulWidget {
  final String text;
  final Color color;
  final VoidCallback onPressed;

  const HoverButton({
    required this.text,
    required this.color,
    required this.onPressed,
  });

  @override
  _HoverButtonState createState() => _HoverButtonState();
}

class _HoverButtonState extends State<HoverButton> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          _isHovering = true;
        });
      },
      onExit: (event) {
        setState(() {
          _isHovering = false;
        });
      },
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          decoration: BoxDecoration(
            color: _isHovering ? widget.color.withOpacity(0.8) : widget.color,
            borderRadius: BorderRadius.circular(12),
            boxShadow: _isHovering
                ? [
                    BoxShadow(
                      color: widget.color.withOpacity(0.6),
                      blurRadius: 10,
                      offset: Offset(0, 6),
                    ),
                  ]
                : [],
          ),
          child: Text(
            widget.text,
            style: GoogleFonts.lato(
              textStyle: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
