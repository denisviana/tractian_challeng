import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../../core/domain/entity/company_entity.dart';

class CompanyCard extends StatelessWidget {
  final CompanyEntity company;
  final VoidCallback onTap;

  const CompanyCard({
    required this.company,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            height: 100, // Adjust height based on design
            decoration: BoxDecoration(
              color: const Color(0xFF007BFF),
              // Primary blue color from the design
              borderRadius: BorderRadius.circular(15), // Rounded corners
            ),
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Icon(
                    Icons.business,
                    // Placeholder icon; replace with custom icon if necessary
                    color: Colors.white,
                    size: 40, // Icon size
                  ),
                ),
                Text(
                  company.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20, // Font size matching the design
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<CompanyEntity>('company', company));
    properties.add(ObjectFlagProperty<VoidCallback>.has('onTap', onTap));
  }
}
