import 'package:flutter/material.dart';

class InfoSintomasScreen extends StatelessWidget {
  final String nome;

  const InfoSintomasScreen({
    super.key,
    required this.nome,
  });

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> detalhes = _detalhesSintomas[nome] ?? {};

    return Scaffold(
      appBar: AppBar(
        title: Text(
          nome,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              nome,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Divider(),
            if (detalhes.isNotEmpty) ...[
              ListTile(
                leading: const Icon(Icons.description, color: Colors.blueAccent),
                title: const Text(
                  'Descrição',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  detalhes['descricao'] ?? 'Informação não disponível.',
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.local_hospital, color: Colors.blueAccent),
                title: const Text(
                  'Possíveis Causas',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  detalhes['causas'] ?? 'Informação não disponível.',
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.medical_services, color: Colors.blueAccent),
                title: const Text(
                  'Tratamentos',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  detalhes['tratamentos'] ?? 'Informação não disponível.',
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

final Map<String, Map<String, String>> _detalhesSintomas = {
  'Febre': {
    'descricao': 'Aumento temporário da temperatura corporal.',
    'causas': 'Infecções virais, bacterianas ou inflamações.',
    'tratamentos': 'Uso de antitérmicos e hidratação adequada.',
  },
  'Tosse': {
    'descricao': 'Reflexo para limpar as vias respiratórias.',
    'causas': 'Resfriado, gripe, asma ou infecções pulmonares.',
    'tratamentos': 'Uso de xaropes ou medicamentos broncodilatadores.',
  },
  'Dor de cabeça': {
    'descricao': 'Desconforto na região da cabeça.',
    'causas': 'Estresse, enxaqueca ou sinusite.',
    'tratamentos': 'Uso de analgésicos e descanso.',
  },
  'Dor abdominal': {
    'descricao': 'Desconforto na região do abdômen.',
    'causas': 'Problemas digestivos ou infecções.',
    'tratamentos': 'Dieta leve, hidratação e, em alguns casos, analgésicos.',
  },
  'Fadiga': {
    'descricao': 'Sensação de cansaço extremo.',
    'causas': 'Falta de sono, anemia ou estresse.',
    'tratamentos': 'Descanso, alimentação equilibrada e consulta médica.',
  },
  'Dor de garganta': {
    'descricao': 'Irritação ou desconforto na garganta.',
    'causas': 'Infecções virais, bacterianas ou alergias.',
    'tratamentos': 'Gargarejo com água morna e sal, ou uso de pastilhas específicas.',
  },
  'Náusea': {
    'descricao': 'Sensação de enjoo e desejo de vomitar.',
    'causas': 'Indigestão, enxaqueca ou gravidez.',
    'tratamentos': 'Uso de medicamentos antieméticos e ingestão de líquidos claros.',
  },
  'Vômito': {
    'descricao': 'Ato de expelir conteúdo do estômago pela boca.',
    'causas': 'Infecções, intoxicação alimentar ou doenças do trato gastrointestinal.',
    'tratamentos': 'Hidratação e repouso, em alguns casos, medicamentos antieméticos.',
  },
  'Diarréia': {
    'descricao': 'Evacuações frequentes e líquidas.',
    'causas': 'Infecções intestinais, alergias alimentares ou intoxicação alimentar.',
    'tratamentos': 'Hidratação, dieta leve e, se necessário, medicamentos antidiarreicos.',
  },
  'Congestão nasal': {
    'descricao': 'Obstrução nasal, dificultando a respiração pelo nariz.',
    'causas': 'Resfriado, sinusite ou alergias.',
    'tratamentos': 'Uso de descongestionantes nasais ou inalações.',
  },
  'Dificuldade para respirar': {
    'descricao': 'Sensação de falta de ar ou respiração superficial.',
    'causas': 'Asma, pneumonia ou infecções respiratórias.',
    'tratamentos': 'Uso de broncodilatadores, hidratação e repouso.',
  },
  'Calafrios': {
    'descricao': 'Sensação de frio com tremores involuntários.',
    'causas': 'Febre, infecções ou choque térmico.',
    'tratamentos': 'Aquecimento e tratamento da condição subjacente.',
  },
  'Erupção cutânea': {
    'descricao': 'Aparecimento de manchas ou lesões na pele.',
    'causas': 'Alergias, infecções ou doenças autoimunes.',
    'tratamentos': 'Uso de pomadas ou medicamentos prescritos por um dermatologista.',
  },
  'Dor muscular': {
    'descricao': 'Desconforto ou dor nos músculos.',
    'causas': 'Esforço físico, lesões ou infecções.',
    'tratamentos': 'Repouso, compressas quentes ou uso de analgésicos.',
  },
  'Tontura': {
    'descricao': 'Sensação de desmaio ou desequilíbrio.',
    'causas': 'Pressão arterial baixa, desidratação ou distúrbios do equilíbrio.',
    'tratamentos': 'Hidratação, repouso e, se necessário, medicamentos.',
  },
};
