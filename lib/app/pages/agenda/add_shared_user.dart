import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class AddSharedUser extends StatelessWidget {
  AddSharedUser({super.key});

  final List<String> items = [];
  final List<String> selected = [];

  final RegExp regex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)*\.com$');

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 25, 20, 0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.07,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Bagikan Undangan', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),),
                  Text('Tambah Peserta', style: TextStyle(fontSize: 12),)],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            TypeAheadField<String>(
              getImmediateSuggestions: true,
              textFieldConfiguration: const TextFieldConfiguration(
                decoration: InputDecoration(border: OutlineInputBorder(), hintText: 'Masukkan abcd@example.com'),
              ),
              suggestionsCallback: (String pattern) async {
                if(regex.hasMatch(pattern)) {
                  return items.where((item) => item.toLowerCase().startsWith(pattern.toLowerCase())).toList();
                }
                return items.where((item) => item.startsWith(' ')).toList();
              },
              itemBuilder: (context, String suggestion) {
                return ListTile(
                  title: Text(suggestion),
                );
              },
              onSuggestionSelected: (String suggestion) {
                // if (!selected.contains(suggestion) && suggestion != authUser!.email) {
                //   setState(() {
                //     selected.add(suggestion);
                //   });
                // }
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            const Text(
              "Peserta",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              margin: const EdgeInsets.symmetric(vertical: 5),
              child: ListView.builder(
                itemCount: selected.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black45),
                      color: Colors.white10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          selected[index],
                          style: TextStyle(
                              fontSize: 16,
                              color: const Color(0xff000000).withOpacity(0.6),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            selected.removeAt(index);
                          },
                          icon: const Icon(
                            color: Colors.grey,
                            Icons.close,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Column(
              children: [
                MaterialButton(
                  height: 40,
                  color: const Color(0xFFFD9611),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Simpan",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                MaterialButton(
                  height: 40,
                  color: const Color(0xFF78BAE5),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Kembali",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}