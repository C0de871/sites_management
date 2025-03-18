import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sites_management/features/visited_sites/presentation/screens/add_visited_site_screen/cubit/add_visited_site_cubit.dart';

import '../../domain/entities/get_visited_sites_entities/get_visited_sites_entity.dart';

// MTN Colors
const mtnYellow = Color(0xFFFFD700);
const mtnDarkYellow = Color(0xFFFFB300);

class SiteDetailsPage extends StatefulWidget {
  final GetVisitedSitesEntity site;

  const SiteDetailsPage({super.key, required this.site});

  @override
  State<SiteDetailsPage> createState() => _SiteDetailsPageState();
}

class _SiteDetailsPageState extends State<SiteDetailsPage> {
  late final GlobalKey<FormState> _formKey;
  late bool _isFormDirty;
  late final TextEditingController _nameController;
  late final TextEditingController _codeController;
  late final TextEditingController _governorateController;
  late final TextEditingController _streetController;
  late final TextEditingController _areaController;
  late final TextEditingController _cityController;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _isFormDirty = false;

    // Initialize controllers with existing site data
    _nameController = TextEditingController(text: widget.site.name);
    _codeController = TextEditingController(text: widget.site.code);
    _governorateController = TextEditingController(text: widget.site.city);
    _streetController = TextEditingController(text: widget.site.street);
    _areaController = TextEditingController(text: widget.site.area);
    _cityController = TextEditingController(text: widget.site.city);

    // Add listeners to track changes
    _nameController.addListener(_markFormDirty);
    _codeController.addListener(_markFormDirty);
    _governorateController.addListener(_markFormDirty);
    _streetController.addListener(_markFormDirty);
    _areaController.addListener(_markFormDirty);
    _cityController.addListener(_markFormDirty);
  }

  void _markFormDirty() {
    if (!_isFormDirty) {
      setState(() {
        _isFormDirty = true;
      });
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _codeController.dispose();
    _governorateController.dispose();
    _streetController.dispose();
    _areaController.dispose();
    _cityController.dispose();
    super.dispose();
  }

  Future<bool> _onWillPop() async {
    if (!_isFormDirty) return true;

    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Unsaved Changes'),
        content: const Text('You have unsaved changes. Do you want to save them before leaving?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false), // Don't save, just leave
            child: const Text('Discard'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true), // Save and leave
            child: const Text('Save'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, null), // Stay on page
            child: const Text('Cancel'),
          ),
        ],
      ),
    );

    if (result == null) return false; // Stay on page
    if (result) {
      _saveSite(); // Save changes
    }
    return true; // Leave page
  }

  void _saveSite() {
    if (_formKey.currentState!.validate()) {
      // In a real app, you would call your API to update the site
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Site updated successfully')),
      );
      setState(() {
        _isFormDirty = false;
      });
      Navigator.pop(context, true); // Return true to indicate refresh is needed
    }
  }

  void _deleteSite() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Site'),
        content: Text('Are you sure you want to delete "${widget.site.name}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              // In a real app, you would call your API to delete the site
              Navigator.pop(context); // Close dialog
              Navigator.pop(context, true); // Return to list page with refresh flag
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Site deleted successfully')),
              );
            },
            child: const Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  void _exportSite() {
    // This would call your API in a real implementation
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Exporting "${widget.site.name}" to Excel...'),
        duration: const Duration(seconds: 2),
      ),
    );

    // Simulate export completion
    Future.delayed(const Duration(seconds: 2), () {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Site exported successfully')),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: mtnYellow,
          title: Text(
            'Edit Site: ${widget.site.name}',
            style: const TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black87),
            onPressed: () async {
              if (await _onWillPop()) {
                Navigator.pop(context);
              }
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.delete_outline, color: Colors.black87),
              onPressed: _deleteSite,
            ),
            IconButton(
              icon: const Icon(Icons.file_download, color: Colors.black87),
              onPressed: _exportSite,
            ),
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.yellow[50]!,
                Colors.white,
                Colors.yellow[50]!,
              ],
            ),
          ),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionTitle('Basic Information'),
                  _buildInfoCard([
                    _buildTextField(
                      controller: _nameController,
                      label: 'Site Name',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter site name';
                        }
                        return null;
                      },
                    ),
                    _buildTextField(
                      controller: _codeController,
                      label: 'Site Code',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter site code';
                        }
                        return null;
                      },
                    ),
                  ]),
                  const SizedBox(height: 16),

                  _buildSectionTitle('Location Details'),
                  _buildInfoCard([
                    _buildTextField(
                      controller: _governorateController,
                      label: 'Governorate',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter governorate';
                        }
                        return null;
                      },
                    ),
                    _buildTextField(
                      controller: _cityController,
                      label: 'City',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter city';
                        }
                        return null;
                      },
                    ),
                    _buildTextField(
                      controller: _areaController,
                      label: 'Area',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter area';
                        }
                        return null;
                      },
                    ),
                    _buildTextField(
                      controller: _streetController,
                      label: 'Street',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter street';
                        }
                        return null;
                      },
                    ),
                  ]),

                  // View All Site Details Button
                  const SizedBox(height: 24),
                  Center(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // This would navigate to the full site information form
                        // where all the site details can be viewed/edited
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BlocProvider(
                              create: (context) => AddVisitedSiteCubit(),
                              // child: const SiteInformationForm(),
                            ),
                          ),
                        );
                      },
                      icon: const Icon(Icons.view_list),
                      label: const Text('View All Site Details'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueGrey,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      ),
                    ),
                  ),

                  const SizedBox(height: 100), // Space for the FAB
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: _isFormDirty
            ? FloatingActionButton(
                backgroundColor: mtnDarkYellow,
                onPressed: _saveSite,
                child: const Icon(Icons.save, color: Colors.white),
              )
            : null,
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, bottom: 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _buildInfoCard(List<Widget> children) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children,
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String? Function(String?) validator,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
        validator: validator,
      ),
    );
  }
}
