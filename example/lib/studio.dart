import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:onfido_sdk/onfido_sdk.dart';
import 'package:onfido_sdk_example/model/biometric_token_callback.dart';

import 'components/alert_dialog.dart';
import 'http/onfido_api.dart';
import 'model/media_callback.dart';

class OnfidoStudio extends StatefulWidget {
  const OnfidoStudio({super.key});

  @override
  State<OnfidoStudio> createState() => _OnfidoStudioState();
}

class _OnfidoStudioState extends State<OnfidoStudio> {
  TextEditingController customApiTokenController = TextEditingController(text: "");
  TextEditingController firstNameController = TextEditingController(text: "first");
  TextEditingController lastNameController = TextEditingController(text: "last");
  TextEditingController emailController = TextEditingController(text: "email@email.com");
  TextEditingController workflowIdController = TextEditingController(text: dotenv.get("WORKFLOW_ID"));
  TextEditingController coBrandTextController = TextEditingController();
  bool hideLogo = false;
  bool withMediaCallback = false;
  bool disableMobileSDKAnalytics = false;
  OnfidoTheme onfidoTheme = OnfidoTheme.AUTOMATIC;
  bool studioTokenEnabled = false;
  bool withBiometricTokenCallback = false;

  startWorkflow() async {
    try {
      if (customApiTokenController.text.isNotEmpty) {
        OnfidoApi.instance.setCustomApiToken(customApiTokenController.text);
      }

      final applicant = await OnfidoApi.instance.createApplicant(
        firstNameController.text,
        lastNameController.text,
        emailController.text,
      );
      final applicantId = applicant.id!;
      var sdkToken = await OnfidoApi.instance.createSdkToken(applicantId);
      final workflowRun = await OnfidoApi.instance.getWorkflowRun(applicantId, workflowIdController.text);
      final workflowRunId = workflowRun.id!;

      if (studioTokenEnabled) {
        sdkToken = workflowRun.studioToken!; // use studio token as sdk token
      }

      final Onfido onfido = Onfido(
          sdkToken: sdkToken,
          iosLocalizationFileName: "onfido_ios_localisation",
          mediaCallback: withMediaCallback ? ExampleMediaCallback() : null,
          biometricTokenCallback: withBiometricTokenCallback ? ExampleBiometricTokenCallback() : null,
          enterpriseFeatures: EnterpriseFeatures(
              hideOnfidoLogo: hideLogo,
              cobrandingText: coBrandTextController.text,
              disableMobileSDKAnalytics: disableMobileSDKAnalytics),
          onfidoTheme: onfidoTheme);

      await onfido.startWorkflow(workflowRunId);
      _showDialog("Success", "Workflow run successfully");
    } catch (error) {
      // handle error
      _showDialog("Error", "Error ${error.toString()}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const Text(
                  "Applicant Configuration",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                TextField(
                  controller: customApiTokenController,
                  decoration: const InputDecoration(
                    labelText: 'Custom API Token',
                  ),
                ),
                TextField(
                  controller: firstNameController,
                  decoration: const InputDecoration(
                    labelText: 'First Name',
                  ),
                ),
                TextField(
                  controller: lastNameController,
                  decoration: const InputDecoration(
                    labelText: 'Last Name',
                  ),
                ),
                TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                  ),
                ),
                TextField(
                  controller: workflowIdController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    labelText: 'Workflow Id',
                  ),
                ),
                CheckboxListTile(
                  title: const Text('Use Studio Token'),
                  value: studioTokenEnabled,
                  onChanged: (bool? newValue) {
                    setState(() {
                      studioTokenEnabled = newValue!;
                    });
                  },
                  contentPadding: EdgeInsets.zero,
                  controlAffinity: ListTileControlAffinity.leading,
                ),
                const SizedBox(height: 30.0),
                const Text(
                  "General Configuration",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                const SizedBox(height: 30.0),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Theme"),
                          ElevatedButton(
                            child: Row(
                              children: [
                                Text(onfidoTheme.name),
                                const SizedBox(width: 6),
                                const Icon(Icons.arrow_drop_down, color: Colors.white),
                              ],
                            ),
                            onPressed: () async => {showThemePicker(context)},
                          ),
                        ],
                      )
                    ])),
                CheckboxListTile(
                  title: const Text('Biometric token callback'),
                  value: withBiometricTokenCallback,
                  onChanged: (bool? newValue) {
                    setState(() {
                      withBiometricTokenCallback = newValue!;
                    });
                  },
                  contentPadding: EdgeInsets.zero,
                  controlAffinity: ListTileControlAffinity.leading,
                ),
                const SizedBox(height: 30.0),
                const Text("Enterprise Settings",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    )),
                TextField(
                  controller: coBrandTextController,
                  decoration: const InputDecoration(
                    labelText: 'Cobranding',
                  ),
                ),
                CheckboxListTile(
                  title: const Text('Hide Logo Configuration'),
                  value: hideLogo,
                  onChanged: (bool? newValue) {
                    setState(() {
                      hideLogo = newValue!;
                    });
                  },
                  contentPadding: EdgeInsets.zero,
                  controlAffinity: ListTileControlAffinity.leading,
                ),
                CheckboxListTile(
                  title: const Text('Use custom media callbacks'),
                  value: withMediaCallback,
                  onChanged: (bool? newValue) {
                    setState(() {
                      withMediaCallback = newValue!;
                    });
                  },
                  contentPadding: EdgeInsets.zero,
                  controlAffinity: ListTileControlAffinity.leading,
                ),
                CheckboxListTile(
                  title: const Text('Disable mobile SDK analytics'),
                  value: disableMobileSDKAnalytics,
                  onChanged: (bool? newValue) {
                    setState(() {
                      disableMobileSDKAnalytics = newValue!;
                    });
                  },
                  contentPadding: EdgeInsets.zero,
                  controlAffinity: ListTileControlAffinity.leading,
                ),
                const SizedBox(height: 30.0),
                ElevatedButton(
                  child: const Text("Launch Workflow"),
                  onPressed: () async => {startWorkflow()},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _showDialog(String title, String message) {
    showAlertDialog(context, title, message);
  }

  showThemePicker(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return CupertinoPicker(
            magnification: 1.22,
            squeeze: 1.2,
            useMagnifier: true,
            itemExtent: 32.0,
            // This sets the initial item.
            scrollController: FixedExtentScrollController(
              initialItem: OnfidoTheme.values.indexOf(onfidoTheme),
            ),
            // This is called when selected item is changed.
            onSelectedItemChanged: (int selectedItem) {
              setState(() {
                onfidoTheme = OnfidoTheme.values[selectedItem];
              });
            },
            children: List<Widget>.generate(OnfidoTheme.values.length, (int index) {
              return Center(child: Text(OnfidoTheme.values[index].name));
            }),
          );
        });
  }
}
