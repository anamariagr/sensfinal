import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sens2/apps/apliplast/controllers/extrusion_controller.dart';

import 'package:sens2/core/components/inputs/dropdown_text.dart';
import 'package:sens2/core/components/inputs/input_text.dart';
import 'package:sens2/core/components/buttons/button.dart';

class FormExtruccion extends StatelessWidget {


  ExtrusionController extrusionController = Get.find<ExtrusionController>();

  Widget _buildDatePicker(BuildContext context) {
    return TextField(
      readOnly: true,
      style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
      decoration: InputDecoration(
        hintText: 'Fecha',
        suffixIcon: Icon(Icons.calendar_today),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(167, 88, 97, 121)),
        ),
      ),
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2024),
        );
        if (pickedDate != null) {}
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 25, 38, 83),
        title: Text(
          //este es el formulario de reporte de extrusion que va a final de turno
          'Final de turno',
          style: TextStyle(color: Colors.white, fontSize: 17),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Get.back(); // Utilizando Get para navegar hacia atrás
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menú',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Opción 1'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Opción 2'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                width: 360,
                decoration: BoxDecoration(
                  color: Color.fromARGB(22, 79, 92, 150),
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.all(25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center, // Center align
                  children: [
                    SizedBox(height: 8),
                    Text(
                      'N° 11',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 11, 19, 68)),
                    ),
                    SizedBox(height: 8),
                    InputTextGeneral(text: 'Orden de producción',controller: extrusionController.productionOrderController.value,),
                    
                    SizedBox(height: 8),
                    _buildDatePicker(context),
                    SizedBox(height: 8),
                    DropdownText(items: ['Turno', 'Item 2', 'Item 3']),
                    SizedBox(height: 8),
                    InputTextGeneral(text: 'Operador', controller: extrusionController.operatorController.value,),
                    SizedBox(height: 8),
                    InputTextGeneral(text: 'Maquina',controller: extrusionController.maquinController.value,),
                    SizedBox(height: 8),
                    InputTextGeneral(text: 'Cliente',controller: extrusionController.clientController.value,),
                    SizedBox(height: 8),
                    InputTextGeneral(text: 'Tabla de rollos', controller: extrusionController.clientController.value),
                    SizedBox(height: 8),
                    InputTextGeneral(text: 'Subtotal ',controller: extrusionController.subtotalController.value),
                    SizedBox(height: 8),
                    InputTextGeneral(text: 'Scrap',controller: extrusionController.scrapController.value),
                    SizedBox(height: 8),
                    InputTextGeneral(text: 'Torta',controller: extrusionController.tortaController.value),
                    SizedBox(height: 8),
                    InputTextGeneral(text: 'Total/Producción',controller: extrusionController.totalProductionController.value),
                    SizedBox(height: 8),
                    InputTextGeneral(text: 'Tabla de materia prima',controller: extrusionController.tableController.value),
                    SizedBox(height: 8),
                    InputTextGeneral(text: 'Materia prima utilizada',controller: extrusionController.materialController.value),
                    SizedBox(height: 8),
                    InputTextGeneral(text: 'Saldo anterior',controller: extrusionController.balanceController.value),
                    SizedBox(height: 8),
                    InputTextGeneral(text: 'Saldo actual',controller: extrusionController.currentBalanceController.value),
                    SizedBox(height: 20),
                    
                    

                Container(
                width: 200, 
                padding: EdgeInsets.symmetric(vertical: 10.0),  
                child: TextButton(
                  onPressed: () {

                    extrusionController.send();
                  },
                  child: Text(
                    'Guardar',
                    style: TextStyle(color: Colors.white), 
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 14, 12, 87), 
                    ),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0), 
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0), 
                      ),
                    ),
                  ),
                ),
              ),


                    SizedBox(height: 8),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
