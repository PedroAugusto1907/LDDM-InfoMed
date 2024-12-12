import 'package:flutter/material.dart';
import 'package:info_med/custom_appbar.dart';

class MedicamentosScreen extends StatefulWidget {
  const MedicamentosScreen({super.key});

  @override
  _MedicamentosScreenState createState() => _MedicamentosScreenState();
}

class _MedicamentosScreenState extends State<MedicamentosScreen> {
  final List<Medicamento> medicamentos = [
    Medicamento(nome: 'Neosaldina', descricao: 'Para dores de cabeça', componentes: 'Dipirona, isometepteno, cafeína', indicacoes: 'Dores de cabeça leves a moderadas.', dosagem: '1 a 2 comprimidos, até 3 vezes ao dia.', precoMedio: 'R\$ 15,00'),
    Medicamento(nome: 'Paracetamol', descricao: 'Para febre e dor', componentes: 'Paracetamol', indicacoes: 'Febre e dores leves a moderadas.', dosagem: '500 mg a cada 6-8 horas.', precoMedio: 'R\$ 10,00'),
    Medicamento(nome: 'Ibuprofeno', descricao: 'Anti-inflamatório e analgésico', componentes: 'Ibuprofeno', indicacoes: 'Inflamações, febres e dores.', dosagem: '200-400 mg a cada 6-8 horas.', precoMedio: 'R\$ 18,00'),
    Medicamento(nome: 'Amoxicilina', descricao: 'Antibiótico para infecções', componentes: 'Amoxicilina', indicacoes: 'Infecções bacterianas.', dosagem: '500 mg a cada 8 horas por 7 a 10 dias.', precoMedio: 'R\$ 25,00'),
    Medicamento(nome: 'Loratadina', descricao: 'Antialérgico', componentes: 'Loratadina', indicacoes: 'Alergias respiratórias e de pele.', dosagem: '10 mg uma vez ao dia.', precoMedio: 'R\$ 12,00'),
    Medicamento(nome: 'Omeprazol', descricao: 'Para problemas gástricos', componentes: 'Omeprazol', indicacoes: 'Refluxo ácido, gastrite, úlceras gástricas.', dosagem: '20 mg uma vez ao dia antes do café da manhã.', precoMedio: 'R\$ 20,00'),
    Medicamento(nome: 'Dipirona', descricao: 'Analgésico e antitérmico', componentes: 'Dipirona', indicacoes: 'Febre e dores intensas.', dosagem: '500 mg a 1 g a cada 6-8 horas.', precoMedio: 'R\$ 8,00'),
    Medicamento(nome: 'Cetoconazol', descricao: 'Antifúngico', componentes: 'Cetoconazol', indicacoes: 'Infecções fúngicas.', dosagem: '200 mg uma vez ao dia.', precoMedio: 'R\$ 30,00'),
    Medicamento(nome: 'Losartana', descricao: 'Para hipertensão', componentes: 'Losartana potássica', indicacoes: 'Controle da hipertensão arterial.', dosagem: '50 mg uma vez ao dia.', precoMedio: 'R\$ 25,00'),
    Medicamento(nome: 'Simeticona', descricao: 'Para gases intestinais', componentes: 'Simeticona', indicacoes: 'Alívio de gases e desconforto abdominal.', dosagem: '40-80 mg após as refeições.', precoMedio: 'R\$ 10,00'),
    Medicamento(nome: 'Metformina', descricao: 'Para diabetes tipo 2', componentes: 'Metformina', indicacoes: 'Controle da glicemia no diabetes tipo 2.', dosagem: '500-850 mg duas vezes ao dia.', precoMedio: 'R\$ 15,00'),
    Medicamento(nome: 'Atenolol', descricao: 'Para hipertensão e angina', componentes: 'Atenolol', indicacoes: 'Controle da pressão arterial e angina.', dosagem: '50 mg uma vez ao dia.', precoMedio: 'R\$ 18,00'),
    Medicamento(nome: 'Clonazepam', descricao: 'Ansiolítico', componentes: 'Clonazepam', indicacoes: 'Ansiedade, insônia, transtornos epilépticos.', dosagem: '0,5-2 mg ao dia.', precoMedio: 'R\$ 30,00'),
    Medicamento(nome: 'Prednisona', descricao: 'Corticosteroide', componentes: 'Prednisona', indicacoes: 'Doenças inflamatórias e autoimunes.', dosagem: '5-60 mg ao dia, conforme prescrição médica.', precoMedio: 'R\$ 15,00'),
    Medicamento(nome: 'Ranitidina', descricao: 'Para úlceras e refluxo', componentes: 'Ranitidina', indicacoes: 'Tratamento de úlceras gástricas e refluxo.', dosagem: '150 mg duas vezes ao dia.', precoMedio: 'R\$ 20,00'),
    Medicamento(nome: 'Azitromicina', descricao: 'Antibiótico', componentes: 'Azitromicina', indicacoes: 'Infecções respiratórias, pele, entre outras.', dosagem: '500 mg uma vez ao dia por 3 dias.', precoMedio: 'R\$ 35,00'),
  ];

  List<Medicamento> filteredMedicamentos = [];

  @override
  void initState() {
    super.initState();
    filteredMedicamentos = medicamentos;
  }

  void _filterMedicamentos(String query) {
    final filtered = medicamentos.where((medicamento) {
      final nomeLower = medicamento.nome.toLowerCase();
      final descricaoLower = medicamento.descricao.toLowerCase();
      final queryLower = query.toLowerCase();

      return nomeLower.contains(queryLower) || descricaoLower.contains(queryLower);
    }).toList();

    setState(() {
      filteredMedicamentos = filtered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tela de Medicamentos',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: Scaffold(
        appBar: CustomAppBar(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: 'Buscar Medicamento',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.search),
                ),
                onChanged: _filterMedicamentos,
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(

                  itemCount: filteredMedicamentos.length,
                  itemBuilder: (context, index) {
                    final medicamento = filteredMedicamentos[index];
                    return MedicamentoTile(medicamento: medicamento);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Medicamento {
  final String nome;
  final String descricao;
  final String componentes;
  final String indicacoes;
  final String dosagem;
  final String precoMedio;

  Medicamento({
    required this.nome,
    required this.descricao,
    required this.componentes,
    required this.indicacoes,
    required this.dosagem,
    required this.precoMedio,
  });
}

class MedicamentoTile extends StatelessWidget {
  final Medicamento medicamento;

  MedicamentoTile({required this.medicamento});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 0.0),
      leading: Icon(Icons.medication, color: Colors.teal, size: 50),
      title: Text(medicamento.nome),
      subtitle: Text(
        medicamento.descricao,
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetalhesMedicamentoScreen(medicamento: medicamento),
          ),
        );
      },
    );
  }
}

class DetalhesMedicamentoScreen extends StatelessWidget {
  final Medicamento medicamento;

  DetalhesMedicamentoScreen({required this.medicamento});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          medicamento.nome,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              medicamento.nome,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Divider(),
            ListTile(
              leading: Icon(Icons.local_pharmacy, color: Colors.teal),
              title: Text(
                'Componentes',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(medicamento.componentes),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.healing, color: Colors.teal),
              title: Text(
                'Indicações',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(medicamento.indicacoes),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.access_time, color: Colors.teal),
              title: Text(
                'Dosagem',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(medicamento.dosagem),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.attach_money, color: Colors.teal),
              title: Text(
                'Preço Médio',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(medicamento.precoMedio),
            ),
          ],
        ),
      ),
    );
  }
}
