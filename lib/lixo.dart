import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Para incluir ícones SVG

class lixos extends StatefulWidget {
  @override
  _IncidentReportScreenState createState() => _IncidentReportScreenState();
}

class _IncidentReportScreenState extends State<lixos> {
  PlatformFile? _selectedFile;
  String _selectedCompany = 'Empresa A';
  String _selectedCountry = 'País A';
  TimeOfDay _selectedTime = TimeOfDay.now();
  DateTime _selectedDate = DateTime.now();
  TextEditingController _messageController = TextEditingController();

  List<String> _companies = ['Empresa A', 'Empresa B', 'Empresa C'];
  List<String> _countries = ['País A', 'País B', 'País C'];

  void _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        _selectedFile = result.files.first;
      });
    }
  }

  Future<void> _pickTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  Future<void> _pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _sendReport() {
    if (_selectedFile != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Relatório enviado com sucesso!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Selecione um arquivo para anexar ao relatório.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reportar Incidente'),
        actions: [
          IconButton(
            icon: Icon(Icons.info),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Informações sobre o aplicativo.')),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Relatar Incidente',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
                Divider(),
                Text(
                  'Selecione uma empresa:',
                  style: TextStyle(fontSize: 16),
                ),
                DropdownButton<String>(
                  value: _selectedCompany,
                  isExpanded: true,
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedCompany = newValue!;
                    });
                  },
                  items:
                      _companies.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                SizedBox(height: 16),
                Text(
                  'Selecione um país:',
                  style: TextStyle(fontSize: 16),
                ),
                DropdownButton<String>(
                  value: _selectedCountry,
                  isExpanded: true,
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedCountry = newValue!;
                    });
                  },
                  items:
                      _countries.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _pickFile,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.attach_file),
                      SizedBox(width: 8),
                      Text('Selecionar Arquivo'),
                    ],
                  ),
                ),
                if (_selectedFile != null)
                  Text(
                    'Arquivo: ${_selectedFile!.name}',
                    style: TextStyle(color: Colors.green),
                  ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => _pickTime(context),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.access_time),
                      SizedBox(width: 8),
                      Text('Selecionar Horário'),
                    ],
                  ),
                ),
                Text('Horário: ${_selectedTime.format(context)}'),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => _pickDate(context),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.calendar_today),
                      SizedBox(width: 8),
                      Text('Selecionar Data'),
                    ],
                  ),
                ),
                Text(
                    'Data: ${_selectedDate.toLocal().toString().split(" ")[0]}'),
                SizedBox(height: 16),
                Text(
                  'Mensagem:',
                  style: TextStyle(fontSize: 16),
                ),
                TextField(
                  controller: _messageController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Digite sua mensagem...',
                  ),
                  maxLines: 3,
                ),
                SizedBox(height: 16),
                Center(
                  child: ElevatedButton(
                    onPressed: _sendReport,
                    child: Text('Enviar Relatório'),
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
