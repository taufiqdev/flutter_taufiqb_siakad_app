import 'package:flutter/material.dart';
import 'package:flutter_taufiqb_siakad_app/pages/mahasiswa/khs_page.dart';
import 'package:flutter_taufiqb_siakad_app/pages/mahasiswa/nilai_mk_page.dart';

import '../../common/components/menu_card.dart';
import '../../common/components/search_input.dart';
import '../../common/constants/colors.dart';
import '../../common/constants/images.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();

    return ListView(
      padding: const EdgeInsets.all(20.0),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Perkuliahan",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: ColorName.primary,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications,
                color: ColorName.primary,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10.0),
        SearchInput(
          controller: searchController,
        ),
        const SizedBox(height: 40.0),
        MenuCard(
          label: 'Kartu Hasil\nStudi',
          backgroundColor: const Color(0xff686BFF),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const KhsPage()));
          },
          imagePath: Images.khs,
        ),
        const SizedBox(height: 40.0),
        MenuCard(
          label: 'Nilai\nMata Kuliah',
          backgroundColor: const Color(0xffFFB023),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const NilaiMkPage()));
          },
          imagePath: Images.nMatkul,
        ),
        const SizedBox(height: 40.0),
        MenuCard(
          label: 'Jadwal\nMata Kuliah',
          backgroundColor: const Color(0xffFF68F0),
          onPressed: () {},
          imagePath: Images.jadwal,
        ),
      ],
    );
  }
}
