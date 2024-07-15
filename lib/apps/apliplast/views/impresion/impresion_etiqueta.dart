import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sens2/apps/apliplast/controllers/printicket_controller.dart';



import 'package:sens2/core/components/inputs/dropdown_text.dart';
import 'package:sens2/core/components/inputs/input_text.dart';
import 'package:sens2/core/components/buttons/button.dart';

class FormEtiqueta extends StatelessWidget {


PrinticketController printicketController = Get.find<PrinticketController>();



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
          'Formulario de impresión',
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
                      'N° 10',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 11, 19, 68)),
                    ),
                    SizedBox(height: 8),
                    InputTextGeneral(text: 'Orden de produccion', controller: printicketController.orderController.value),
                    SizedBox(height: 8),
                    Container(
                      margin: EdgeInsets.only(top: 30, bottom: 30),
                      width: double.infinity,
                      color: Colors.grey.withOpacity(0.2),
                      child: Column(
                        children: [
                          SizedBox(height: 16),
                          Text(
                            'Peso neto 10kg',
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 11, 19, 68)),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Bobina:',
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 11, 19, 68)),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Peso bruto:',
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 11, 19, 68)),
                          ),
                          SizedBox(height: 16),
                          
                           Container(
                                width: 200, 
                                padding: EdgeInsets.symmetric(vertical: 10.0),  
                                child: TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Capturar',
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
                          
                          SizedBox(height: 16),
                          Text(
                            'Peso Bruto 10kg',
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 11, 19, 68)),
                          ),
                          SizedBox(height: 16),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    InputTextGeneral(text: 'Rollo N°', controller: printicketController.rollController.value),
                    SizedBox(height: 8),
                    _buildDatePicker(context),
                    SizedBox(height: 8),
                    DropdownText(items: ['Turno', 'Item 2', 'Item 3']),
                    SizedBox(height: 8),
                    InputTextGeneral(text: 'Operador', controller: printicketController.operatorController.value),
                    SizedBox(height: 8),
                    InputTextGeneral(text: 'Maquina', controller: printicketController.maquinController.value),
                    SizedBox(height: 8),
                    InputTextGeneral(text: 'Medida', controller: printicketController.extentController.value),
                    SizedBox(height: 8),
                    InputTextGeneral(text: 'Espesor', controller: printicketController.thicknessController.value),
                    SizedBox(height: 8),
                    InputTextGeneral(text: 'Color', controller: printicketController.colorController.value),
                    SizedBox(height: 8),
                    InputTextGeneral(text: 'Densidad', controller: printicketController.densityController.value),
                    SizedBox(height: 8),
                    InputTextGeneral(text: 'Cliente', controller: printicketController.clientController.value),
                    SizedBox(height: 20),
                    
                    

                Container(
                width: 200, 
                padding: EdgeInsets.symmetric(vertical: 10.0),  
                child: TextButton(
                  onPressed: () {

                    printicketController.send();
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
