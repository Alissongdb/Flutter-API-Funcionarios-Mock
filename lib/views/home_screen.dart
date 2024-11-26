import 'package:be_talent/controllers/employees_controller.dart';
import 'package:be_talent/models/employees_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Inicializar a lista de empregados vazia
  List<Employee> _employees = [];
  // Inicializar a lista de empregados filtrados vazia
  List<Employee> _filteredEmployees = [];
  // Controller do textfield
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchEmployees().then((data) {
      setState(() {
        _employees = data;
        _filteredEmployees = data; // Atualiza os funcionários filtrados
      });
    }).catchError((error) {
      // Tratar erros ao buscar os funcionários
      print('Erro ao buscar funcionários: $error');
    });

    _searchController.addListener(_filterEmployees);
  }

  void _filterEmployees() {
    final query = _searchController.text.toLowerCase();

    setState(() {
      _filteredEmployees = _employees.where((employee) {
        final name = employee.name?.toLowerCase() ?? ''; // Verificação de nulo
        final job = employee.job?.toLowerCase() ?? ''; // Verificação de nulo
        final phone =
            employee.phone?.toLowerCase() ?? ''; // Verificação de nulo

        return name.contains(query) ||
            job.contains(query) ||
            phone.contains(query);
      }).toList();
    });
  }

// apaga os dados da memoria ao fechar a tela
  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

// View principal
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const Padding(
          padding: EdgeInsets.only(left: 18),
          child: CircleAvatar(
            backgroundColor: Color(0xFFF5F5F5),
            child: Text(
              'CG',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.black87),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 18),
            const Text(
              'Funcionários',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Color(0xFF1C1C1C),
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: const Color(0xFFF5F5F5),
              ),
              child: Row(
                children: [
                  const Icon(Icons.search, color: Colors.black),
                  const SizedBox(width: 4),
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      decoration: const InputDecoration(
                        hintText: 'Pesquisar',
                        hintStyle: TextStyle(fontSize: 16),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.2),
                    offset: Offset(0, 1),
                    blurRadius: 2,
                  ),
                ],
                color: const Color(0XFFEDEFFB),
                border: Border.all(
                  color: const Color.fromRGBO(223, 223, 223, 1),
                  width: 1,
                ),
              ),
              padding: const EdgeInsets.symmetric(vertical: 14),
              child: const Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 14.5),
                      child: Row(
                        children: [
                          Text(
                            'Foto',
                            style: TextStyle(
                              color: Color.fromRGBO(27, 27, 27, 1),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: 24),
                          Text(
                            'Nome',
                            style: TextStyle(
                              color: Color.fromRGBO(27, 27, 27, 1),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 35),
                    child: CircleAvatar(
                      radius: 5,
                      backgroundColor: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: _filteredEmployees.isEmpty
                  ? const Center(child: Text('Nenhum funcionário encontrado.'))
                  : ListView.builder(
                      itemCount: _filteredEmployees.length,
                      itemBuilder: (context, index) {
                        final employee = _filteredEmployees[index];

                        return Column(
                          children: [
                            ExpansionTile(
                              title: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundImage: employee.image != null
                                        ? NetworkImage(employee.image!)
                                        : null,
                                    child: employee.image == null
                                        ? const Icon(Icons.person)
                                        : null,
                                  ),
                                  const SizedBox(width: 20),
                                  Text(employee.name ?? 'Nome não informado'),
                                ],
                              ),
                              trailing: const Icon(
                                Icons.expand_more,
                                size: 30,
                                color: Color(0xFF0500FF),
                              ),
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text('Cargo: ',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          Text(employee.job ?? 'Não informado'),
                                        ],
                                      ),
                                      const SizedBox(height: 8),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text('Data de admissão: ',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          Text(
                                            employee.admissionDate != null
                                                ? DateFormat('dd/MM/yyyy')
                                                    .format(
                                                        employee.admissionDate!)
                                                : 'Não informado',
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 8),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text('Telefone: ',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                          Text(employee.phone ??
                                              'Não informado'),
                                        ],
                                      ),
                                      const SizedBox(height: 8),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
