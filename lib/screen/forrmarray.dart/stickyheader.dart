import 'package:flutter/material.dart';
import 'package:reactive_date_time_picker/reactive_date_time_picker.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:tab/screen/button.dart';
import 'package:tab/screen/dropdown.dart';
import 'package:tab/screen/hold.dart';
import 'package:tab/screen/textfieldwidget.dart';
import 'package:tab/screen/textwidget.dart';

class StickyHeaderScreen extends StatefulWidget {
  const StickyHeaderScreen({super.key});

  @override
  State<StickyHeaderScreen> createState() => _StickyHeaderScreenState();
}

class _StickyHeaderScreenState extends State<StickyHeaderScreen> {
  final FormGroup form = FormGroup({
    'hold': FormControl<String>(),
    'entries': FormArray([
      FormGroup({
        'dropdownField': FormControl<String>(),
        'date': FormControl<DateTime>(),
        'dday': FormControl<String>(),
        'dmiss': FormControl<String>(),
        'dexample': FormControl<String>(),
        'time': FormControl<DateTime>(),
        'daytext': FormControl<String>(),
        'seven': FormControl<String>(),
      }),
    ]),
  });

  FormArray get entries => form.control('entries') as FormArray;

  // ignore: unused_element
  void _addEntry() {
    entries.add(
      FormGroup({
        'dropdownField': FormControl<String>(),
        'date': FormControl<DateTime>(),
        'dday': FormControl<String>(),
        'dmiss': FormControl<String>(),
        'dexample': FormControl<String>(),
        'time': FormControl<DateTime>(),
        'daytext': FormControl<String>(),
        'seven': FormControl<String>(),
      }),
    );
    setState(() {});
  }

  // ignore: unused_element
  void _deleteEntry(int index) {
    entries.removeAt(index);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ReactiveForm(
        formGroup: form,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
          child: CustomScrollView(
            slivers: <Widget>[
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    const Row(
                      children: [
                        Text(
                          'Add Shift Labor',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Job Name'),
                              const SizedBox(height: 10),
                              DropDownWidget(
                                items: const [
                                  '111459 -Nord Pollex',
                                  'Item 2',
                                  'Item 3'
                                ],
                                onChanged: (value) {
                                  // print('Selected: $value');
                                },
                                suffixIcon: const Icon(Icons.arrow_drop_down),
                                initialValue: '111459 -Nord Pollex',
                                borderRadius: 4.0,
                                borderColor: Colors.grey,
                                hintText: '111459 -Nord Pollex',
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 20),
                        const Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('# of Hold'),
                              SizedBox(height: 10),
                              HoldTextWidget(
                                formControlName: 'hold',
                                hintText: 'Enter text here',
                                keyboardType: TextInputType.text,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Cargo'),
                              const SizedBox(height: 10),
                              DropDownWidget(
                                hintText: 'Barite',
                                items: const ['Barite', 'Item 2', 'Item 3'],
                                onChanged: (value) {
                                  // print('Selected: $value');
                                },
                                suffixIcon: const Icon(Icons.arrow_drop_down),
                                initialValue: 'Barite',
                                borderRadius: 4.0,
                                borderColor: Colors.grey,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
              SliverAppBar(
                foregroundColor: Colors.blue,
                backgroundColor: const Color.fromARGB(255, 241, 236, 236),
                // forceElevated: false,
                shadowColor: Colors.black,
                scrolledUnderElevation: 1,
                elevation: 1,
                // collapsedHeight: 60,
                excludeHeaderSemantics: true,
                stretch: false,
                surfaceTintColor: Colors.transparent,
                automaticallyImplyLeading: false,
                expandedHeight: 50,
                floating: false,
                pinned: true,
                snap: false,
                forceMaterialTransparency: false,
                flexibleSpace: FlexibleSpaceBar(
                  expandedTitleScale: 2,
                  // stretchModes: [StretchMode.zoomBackground],
                  collapseMode: CollapseMode.none,
                  titlePadding: const EdgeInsets.all(0),
                  centerTitle: false,

                  title: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 243, 237, 237),
                        borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 8, 0),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Expanded(
                                  flex: 2,
                                  child: Text(
                                    'Supervisor',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                const Expanded(
                                  flex: 1,
                                  child: Text(
                                    'Date',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                const Expanded(
                                  flex: 1,
                                  child: Text(
                                    'Shift',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                const Expanded(
                                  flex: 1,
                                  child: Text(
                                    'Crano',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                const Expanded(
                                  flex: 1,
                                  child: Text(
                                    'Start Time',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                const Expanded(
                                  flex: 1,
                                  child: Text(
                                    'Expected\nDuration', // Fixed typo
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    textAlign: TextAlign
                                        .center, // Center text if needed
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: GestureDetector(
                                    onTap: () {
                                      _addEntry();
                                    },
                                    child: Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: const Center(
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              // SliverList

              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (
                    BuildContext context,
                    int index,
                  ) {
                    return ReactiveFormArray(
                      formArrayName: 'entries',
                      builder: (context, formArray, child) {
                        return Column(
                          children: List.generate(
                            formArray.controls.length,
                            (index) {
                              final formGroup = formArray
                                  .control(index.toString()) as FormGroup;

                              return Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 241, 236, 236),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 8, 0),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Flexible(
                                              flex: 2,
                                              child: ReactiveCustomDropdown(
                                                items: const [
                                                  'Marsman Bellok',
                                                  'Item 2',
                                                  'Item 3'
                                                ],
                                                suffixIcon: const Icon(
                                                    Icons.arrow_drop_down),
                                                initialValue: 'Marsman Bellok',
                                                hintText: 'Marsman Bellok',
                                                borderColorTop:
                                                    const Color.fromARGB(
                                                        255, 214, 212, 212),
                                                borderColorBottom:
                                                    const Color.fromARGB(
                                                        255, 214, 212, 212),
                                                borderColorLeft:
                                                    const Color.fromARGB(
                                                        255, 214, 212, 212),
                                                borderColorRight:
                                                    const Color.fromARGB(
                                                        255, 214, 212, 212),
                                                borderWidthTop: 1.0,
                                                borderWidthBottom: 1.0,
                                                borderWidthLeft: 1.0,
                                                borderWidthRight: 1.0,
                                                formControl: formGroup.control(
                                                        'dropdownField')
                                                    as FormControl<String>,
                                              ),
                                            ),
                                            Flexible(
                                              flex: 1,
                                              child: Container(
                                                decoration: const BoxDecoration(
                                                  border: Border(
                                                    top: BorderSide(
                                                      width: 1,
                                                      color: Color.fromARGB(
                                                          255, 214, 212, 212),
                                                    ),
                                                    bottom: BorderSide(
                                                      width: 1,
                                                      color: Color.fromARGB(
                                                          255, 214, 212, 212),
                                                    ),
                                                  ),
                                                ),
                                                child: ReactiveDateTimePicker(
                                                  formControl: formGroup
                                                          .control('date')
                                                      as FormControl<DateTime>,
                                                  decoration:
                                                      const InputDecoration(
                                                    hintText: '11/24/23',
                                                    border: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        width: 1,
                                                        color: Color.fromARGB(
                                                            255, 214, 212, 212),
                                                      ),
                                                    ),
                                                    enabledBorder:
                                                        InputBorder.none,
                                                    focusedBorder:
                                                        InputBorder.none,
                                                    errorBorder:
                                                        InputBorder.none,
                                                    focusedErrorBorder:
                                                        InputBorder.none,
                                                    contentPadding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 10,
                                                            horizontal: 16),
                                                    suffixIcon: Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              0, 0, 15, 0),
                                                      child: Icon(
                                                          Icons.calendar_today),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Flexible(
                                              flex: 1,
                                              child: ReactiveCustomDropdown(
                                                items: const [
                                                  'Day',
                                                  'Day 2',
                                                  'Day 3',
                                                  'Day 4'
                                                ],
                                                // onChanged: (value) {
                                                //   print('Selected: $value');
                                                // },
                                                suffixIcon: const Icon(
                                                    Icons.arrow_drop_down),
                                                initialValue: 'Day',
                                                hintText: 'Day',
                                                borderColorBottom:
                                                    const Color.fromARGB(
                                                        255, 214, 212, 212),
                                                borderColorTop:
                                                    const Color.fromARGB(
                                                        255, 214, 212, 212),
                                                borderColorLeft:
                                                    const Color.fromARGB(
                                                        255, 214, 212, 212),
                                                borderColorRight:
                                                    const Color.fromARGB(
                                                        255, 214, 212, 212),
                                                borderWidthBottom: 1.0,
                                                borderWidthTop: 1.0,
                                                borderWidthLeft: 1.0,
                                                borderWidthRight: 1.0,
                                                formControl:
                                                    formGroup.control('dday')
                                                        as FormControl<String>,
                                              ),
                                            ),
                                            Flexible(
                                              flex: 1,
                                              child: ReactiveCustomDropdown(
                                                items: const [
                                                  'Miss Tare',
                                                  'Miss Dina',
                                                  'Miss B',
                                                ],
                                                // onChanged: (value) {
                                                //   print('Selected: $value');
                                                // },
                                                suffixIcon: const Icon(
                                                    Icons.arrow_drop_down),
                                                initialValue: 'Miss Tare',
                                                hintText: 'Miss Tare',
                                                borderColorBottom:
                                                    const Color.fromARGB(
                                                        255, 214, 212, 212),
                                                borderColorTop:
                                                    const Color.fromARGB(
                                                        255, 214, 212, 212),
                                                borderColorLeft:
                                                    const Color.fromARGB(
                                                        255, 214, 212, 212),
                                                borderColorRight:
                                                    const Color.fromARGB(
                                                        255, 214, 212, 212),
                                                borderWidthBottom: 1.0,
                                                borderWidthTop: 1.0,
                                                borderWidthLeft: 1.0,
                                                borderWidthRight: 1.0,
                                                formControl:
                                                    formGroup.control('dmiss')
                                                        as FormControl<String>,
                                              ),
                                            ),
                                            Flexible(
                                              flex: 1,
                                              child: Container(
                                                decoration: const BoxDecoration(
                                                  border: Border(
                                                    top: BorderSide(
                                                      width: 1,
                                                      color: Color.fromARGB(
                                                          255, 214, 212, 212),
                                                    ),
                                                    bottom: BorderSide(
                                                      width: 1,
                                                      color: Color.fromARGB(
                                                          255, 214, 212, 212),
                                                    ),
                                                  ),
                                                ),
                                                child: ReactiveDateTimePicker(
                                                  formControl: formGroup
                                                          .control('time')
                                                      as FormControl<DateTime>,
                                                  decoration:
                                                      const InputDecoration(
                                                    hintText: '10:33 PM',
                                                    border: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        width: 1,
                                                        color: Color.fromARGB(
                                                            255, 214, 212, 212),
                                                      ),
                                                    ),
                                                    enabledBorder:
                                                        InputBorder.none,
                                                    focusedBorder:
                                                        InputBorder.none,
                                                    errorBorder:
                                                        InputBorder.none,
                                                    focusedErrorBorder:
                                                        InputBorder.none,
                                                    contentPadding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 10,
                                                            horizontal: 16),
                                                    suffixIcon: Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              0, 0, 15, 0),
                                                      child: Icon(
                                                          Icons.access_time),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Flexible(
                                              flex: 1,
                                              child: Container(
                                                height: 50,
                                                decoration: const BoxDecoration(
                                                    border: Border(
                                                  top: BorderSide(
                                                    width: 1,
                                                    color: Color.fromARGB(
                                                        255, 214, 212, 212),
                                                  ),
                                                  right: BorderSide(
                                                    width: 1,
                                                    color: Color.fromARGB(
                                                        255, 214, 212, 212),
                                                  ),
                                                  bottom: BorderSide(
                                                    width: 1,
                                                    color: Color.fromARGB(
                                                        255, 214, 212, 212),
                                                  ),
                                                  left: BorderSide(
                                                    width: 1,
                                                    color: Color.fromARGB(
                                                        255, 214, 212, 212),
                                                  ),
                                                )),
                                                child: const Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      30, 0, 20, 0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                vertical: 12),
                                                        child: Text(
                                                          '5',
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        ),
                                                      ),
                                                      Text(
                                                        'Hrs',
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 40,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 25,
                                                    bottom: 0,
                                                    left: 20),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    _deleteEntry(index);
                                                  },
                                                  child: const Center(
                                                    child: Icon(
                                                      Icons.delete,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Flexible(
                                              flex: 1,
                                              child: ReactiveCustomDropdown(
                                                items: const [
                                                  'Example 1',
                                                  'Example 2',
                                                  'Example 3'
                                                ],
                                                suffixIcon: const Icon(
                                                    Icons.arrow_drop_down),
                                                initialValue: 'Example 1',
                                                hintText: 'Example 1',
                                                borderColorBottom:
                                                    const Color.fromARGB(
                                                        255, 214, 212, 212),
                                                borderColorLeft:
                                                    const Color.fromARGB(
                                                        255, 214, 212, 212),
                                                borderColorRight:
                                                    const Color.fromARGB(
                                                        255, 214, 212, 212),
                                                borderWidthBottom: 1.0,
                                                borderWidthLeft: 1.0,
                                                borderWidthRight: 1.0,
                                                formControl: formGroup
                                                        .control('dexample')
                                                    as FormControl<String>,
                                              ),
                                            ),
                                            Flexible(
                                              flex: 1,
                                              child: TextWidgetForm(
                                                formControl:
                                                    formGroup.control('daytext')
                                                        as FormControl<String>,
                                                hintText: '345364',
                                                keyboardType:
                                                    TextInputType.text,
                                                borderColorBottom:
                                                    const Color.fromARGB(
                                                        255, 214, 212, 212),
                                                borderColorLeft:
                                                    const Color.fromARGB(
                                                        255, 214, 212, 212),
                                                borderColorRight:
                                                    const Color.fromARGB(
                                                        255, 214, 212, 212),
                                                borderWidthBottom: 1.0,
                                                borderWidthLeft: 1.0,
                                                borderWidthRight: 1.0,
                                              ),
                                            ),
                                            Flexible(
                                              flex: 1,
                                              child: TextWidgetForm(
                                                formControl:
                                                    formGroup.control('seven')
                                                        as FormControl<String>,
                                                hintText: '7',
                                                keyboardType:
                                                    TextInputType.text,
                                                borderColorBottom:
                                                    const Color.fromARGB(
                                                        255, 214, 212, 212),
                                                borderColorLeft:
                                                    const Color.fromARGB(
                                                        255, 214, 212, 212),
                                                borderColorRight:
                                                    const Color.fromARGB(
                                                        255, 214, 212, 212),
                                                borderWidthBottom: 1.0,
                                                borderWidthLeft: 1.0,
                                                borderWidthRight: 1.0,
                                              ),
                                            ),
                                            const SizedBox(
                                              child: Padding(
                                                padding:
                                                    EdgeInsets.only(left: 44),
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    );
                  },
                  childCount: 1, // Use childCount for SliverList
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButton(
              buttonColor: const Color.fromARGB(255, 210, 208, 208),
              textColor: Colors.black,
              title: 'Cancel',
              onPressed: () {
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (context) => const StickyHeaderScreen()));
              },
              borderColor: Colors.grey,
            ),
            const SizedBox(
              width: 20,
            ),
            CustomButton(
              buttonColor: Colors.blue,
              textColor: Colors.white,
              title: 'Save',
              onPressed: () {
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (context) => DynamicFormArrayExample()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
