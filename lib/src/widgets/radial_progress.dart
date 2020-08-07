import 'dart:math';

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  final porcentaje;
  final Color colorPrimario;
  final Color colorSecundario;
  final double grosorSecundario;
  final double grosorPrimario;
  final bool mostrarTextoPorcentaje;
  final double textoPorcentajeGrosor;
  final Color textoPorcentajeColor;

  const RadialProgress({
    @required this.porcentaje, 
    this.colorPrimario          = Colors.blue, 
    this.colorSecundario        = Colors.grey, 
    this.grosorPrimario         = 4.0,
    this.grosorSecundario       = 4.0, 
    this.mostrarTextoPorcentaje = false,
    this.textoPorcentajeGrosor  = 20,
    this.textoPorcentajeColor   = Colors.black
  }); 

  @override
  _RadialProgressState createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress> with SingleTickerProviderStateMixin {
  
  AnimationController controller;
  double porcentajeAnterior;


  @override
  void initState() {
    porcentajeAnterior = widget.porcentaje;

    controller = new AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    controller.forward( from: 0);

    final diferenciaAnimar = widget.porcentaje - porcentajeAnterior;
    porcentajeAnterior = widget.porcentaje;

    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget child) {
        return Container(
        padding: EdgeInsets.all(10.0),
        width: double.infinity,
        height: double.infinity,
        child: CustomPaint(
          child: widget.mostrarTextoPorcentaje  
                  ? Center(
                      child: Text('${widget.porcentaje}', 
                                  style: TextStyle( 
                                    fontSize: widget.textoPorcentajeGrosor, 
                                    fontWeight: FontWeight.bold,
                                    color: widget.textoPorcentajeColor
                                  )
                      )
                    )
                  : null,
          painter: _MiRadialProgress( 
            (widget.porcentaje - diferenciaAnimar) + (diferenciaAnimar * controller.value),
            widget.colorPrimario,
            widget.colorSecundario,
            widget.grosorSecundario,
            widget.grosorPrimario
           ),
        ),
      );
      },
    );

    
  }
}

class _MiRadialProgress extends CustomPainter{

  final porcentaje;
  final Color colorPrimario;
  final Color colorSecundario;
  final double grosorSecundario;
  final double grosorPrimario;

  _MiRadialProgress(this.porcentaje, this.colorPrimario, this.colorSecundario, this.grosorSecundario, this.grosorPrimario);

  @override
  void paint(Canvas canvas, Size size) {
    //Para aplicar un gradiente
    /*
    final Rect rect = new Rect.fromCircle(
      center: Offset(0,0),
      radius: 180
    );

    final Gradient gradiente = new LinearGradient(
      colors: [
        Color(0xffC012FF),
        Color(0xff6D05E8),
        Colors.red,
      ]
    );
  */
    final paint = new Paint()
      ..strokeWidth = grosorSecundario
      ..color       = colorSecundario
      ..style       = PaintingStyle.stroke;

    final Offset center = new Offset(size.width * 0.5, size.height * 0.5);
    final double radio  = min( size.width * 0.5, size.height * 0.5);
    canvas.drawCircle(center, radio, paint);

    //Arco
    final paintArco = new Paint()
      ..strokeWidth = grosorPrimario
      ..color       = colorPrimario
      //..shader      = gradiente.createShader(rect)
      ..strokeCap   = StrokeCap.round
      ..style       = PaintingStyle.stroke;
    
    //Para que se debera ir llenando
    double arcAngle = 2 * pi * (porcentaje / 100);

    canvas.drawArc(
      Rect.fromCircle( center: center, radius: radio), 
      -pi/2, 
      arcAngle, 
      false, 
      paintArco
    );
    
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate)  => true;
  
} 