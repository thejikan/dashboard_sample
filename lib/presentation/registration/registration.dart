import 'package:dashboard/presentation/registration/bloc/registration_cubit.dart';
import 'package:dashboard/presentation/registration/registration_skeleton.dart';
import 'package:dashboard/service/detailsService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// BankListDataModel _bankChoose = BankListDataModel("SBII",
//     "https://www.kindpng.com/picc/m/83-837808_sbi-logo-state-bank-of-india-group-png.png");
List<BankListDataModel> bankDataList = [
  BankListDataModel("SBI",
      "https://www.kindpng.com/picc/m/83-837808_sbi-logo-state-bank-of-india-group-png.png"),
  BankListDataModel("HDFC",
      "https://www.pngix.com/pngfile/big/12-123534_download-hdfc-bank-hd-png-download.png"),
  BankListDataModel("ICICI",
      "https://www.searchpng.com/wp-content/uploads/2019/01/ICICI-Bank-PNG-Icon-715x715.png"),
];
int _bankChoose = 1;
int _bankChoose1 = 1;

class RegistrationView extends StatelessWidget {
  const RegistrationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegistrationViewCubit>(
      create: (context) =>
          RegistrationViewCubit(context.read<DetailsService>()),
      child: _RegistrationView(),
    );
  }
}

class _RegistrationView extends StatelessWidget {
  _RegistrationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<RegistrationViewCubit, RegistrationViewState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state.isLoading) {
          return const RegistrationSkeletonView();
        }
        return Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 40, 10, 16),
                  child: Text(
                    'Great!',
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 72, vertical: 10),
                  child: Expanded(
                    child: Text(
                      'Help us with basic details for personalized recommendations',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 24.0),
                      child: TextFormField(
                        style: TextStyle(fontSize: 20),
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            contentPadding:
                            EdgeInsets.all(10.0),
                            labelText: 'First name\*',
                            labelStyle: TextStyle(color: Colors.grey[700]),
                            floatingLabelStyle: TextStyle(color: Colors.black87),
                            suffixIcon: Icon(
                              Icons.close,
                              size: 16,
                            ),
                            suffixIconColor: Colors.grey[500]),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 24.0),
                      child: TextFormField(
                        style: TextStyle(fontSize: 20),
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            contentPadding:
                            EdgeInsets.all(10.0),
                            labelText: 'Last name\*',
                            labelStyle: TextStyle(color: Colors.grey[700]),
                            floatingLabelStyle: TextStyle(color: Colors.black87),
                            suffixIcon: Icon(
                              Icons.close,
                              size: 16,
                            ),
                            suffixIconColor: Colors.grey[500]),
                            // suffixText: '*',
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 24.0),
                      child: SizedBox(
                        height: 36,
                        child: DropdownButton<int>(
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                            fontFamily: "verdana_regular",
                          ),
                          hint: Text(
                            "Select your profile\*",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontFamily: "verdana_regular",
                            ),
                          ),
                          icon: Icon(Icons.keyboard_arrow_down_outlined),
                          items:
                              [1, 2, 3].map<DropdownMenuItem<int>>((int value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Row(
                                children: [
                                  new CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        selectBankList(value).bank_logo),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text(selectBankList(value).bank_name),
                                ],
                              ),
                            );
                          }).toList(),
                          isExpanded: true,
                          isDense: true,
                          onChanged: (newSelectedBank) {
                            _bankChoose = newSelectedBank!;
                          },
                          value: _bankChoose,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 24.0),
                      child: SizedBox(
                        height: 36,
                        child: DropdownButton<int>(
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                            fontFamily: "verdana_regular",
                          ),
                          hint: Text(
                            "Experience\*",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontFamily: "verdana_regular",
                            ),
                          ),
                          icon: Icon(Icons.keyboard_arrow_down_outlined),
                          items:
                              [1, 2, 3].map<DropdownMenuItem<int>>((int value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Column(
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                // mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(selectBankList(value).bank_name),
                                  // Row(
                                  //   children: [
                                  //     Text(selectBankList(value).bank_name),
                                  //     Icon(Icons.keyboard_arrow_right_outlined),
                                  //     Text(selectBankList(value).bank_name),
                                  //   ],
                                  // ),
                                ],
                              ),
                            );
                          }).toList(),
                          isExpanded: true,
                          isDense: true,
                          onChanged: (newSelectedBank) {
                            _bankChoose1 = newSelectedBank!;
                          },
                          value: _bankChoose1,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 24.0),
                      child: TextFormField(
                        style: TextStyle(fontSize: 20),
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            contentPadding:
                                EdgeInsets.all(10.0),
                            labelText: 'Email\*',
                            labelStyle: TextStyle(color: Colors.grey[700]),
                            floatingLabelStyle: TextStyle(color: Colors.black87),
                            suffixIcon: Icon(
                              Icons.close,
                              size: 16,
                            ),
                            suffixIconColor: Colors.grey[500]),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 42,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.indigo),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ))),
                        onPressed: () {},
                        child: Text('Join the Community')),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class BankListDataModel {
  String bank_name;
  String bank_logo;

  BankListDataModel(this.bank_name, this.bank_logo);
}

BankListDataModel selectBankList(int code) {
  switch (code) {
    case 1:
      return BankListDataModel("SBI",
          "https://www.kindpng.com/picc/m/83-837808_sbi-logo-state-bank-of-india-group-png.png");
    case 2:
      return BankListDataModel("HDFC",
          "https://www.pngix.com/pngfile/big/12-123534_download-hdfc-bank-hd-png-download.png");
    case 3:
      return BankListDataModel("ICICI",
          "https://www.searchpng.com/wp-content/uploads/2019/01/ICICI-Bank-PNG-Icon-715x715.png");
    default:
      return BankListDataModel("ICICI",
          "https://www.searchpng.com/wp-content/uploads/2019/01/ICICI-Bank-PNG-Icon-715x715.png");
  }
}
