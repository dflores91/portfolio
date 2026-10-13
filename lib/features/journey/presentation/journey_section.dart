import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/core/constants/app_data.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/utils/responsive_layout.dart';
import 'package:portfolio/shared/widgets/hover_card.dart';

class JourneySection extends StatelessWidget {
  const JourneySection({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = ResponsiveLayout.isDesktop(context);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 48 : 24,
        vertical: 70,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: isDesktop
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 4, child: _buildOverviewColumn()),
                    const SizedBox(width: 48),
                    Expanded(flex: 8, child: _buildTimelineColumn()),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildOverviewColumn(),
                    const SizedBox(height: 48),
                    _buildTimelineColumn(),
                  ],
                ),
        ),
      ),
    );
  }

  Widget _buildOverviewColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Trayectoria\nProfesional',
          style: GoogleFonts.outfit(
            fontSize: 40,
            fontWeight: FontWeight.w800,
            color: AppColors.textPrimary,
            letterSpacing: -0.8,
            height: 1.15,
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'Más de 6 años de evolución en ingeniería, desde desarrollo móvil inicial '
          'hasta la arquitectura de ecosistemas a escala empresarial.',
          style: TextStyle(
            fontSize: 16,
            color: AppColors.textSecondary,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 32),
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: _buildStatBox(
                  value: '6+',
                  label: 'Años de\nExperiencia',
                  valueColor: AppColors.primary,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildStatBox(
                  value: '4+',
                  label: 'Despliegues\nEmpresariales',
                  valueColor: AppColors.tertiary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStatBox({
    required String value,
    required String label,
    required Color valueColor,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 22),
      decoration: BoxDecoration(
        color: AppColors.cardSurface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            value,
            textAlign: TextAlign.center,
            style: GoogleFonts.outfit(
              fontSize: 32,
              fontWeight: FontWeight.w800,
              color: valueColor,
              height: 1.1,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label.toUpperCase(),
            textAlign: TextAlign.center,
            style: GoogleFonts.jetBrainsMono(
              fontSize: 11,
              color: AppColors.textMuted,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.6,
              height: 1.35,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineColumn() {
    return Column(
      children: AppData.experiences
          .map(
            (exp) {
              final int index = AppData.experiences.indexOf(exp);
              final Color accentColor = switch (index) {
                0 => AppColors.primary,
                1 => AppColors.secondary,
                2 => AppColors.tertiary,
                3 => AppColors.emerald,
                _ => AppColors.primaryContainer,
              };

              return Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: HoverCard(
                  leftBorderColor: accentColor,
                  hoverBorderColor: accentColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  exp.role,
                                  style: GoogleFonts.outfit(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: accentColor,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  '${exp.company} // ${exp.period}',
                                  style: GoogleFonts.jetBrainsMono(
                                    fontSize: 13,
                                    color: AppColors.textSecondary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: accentColor.withValues(alpha: 0.12),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: accentColor.withValues(alpha: 0.25),
                              ),
                            ),
                            child: Text(
                              exp.badge,
                              style: GoogleFonts.jetBrainsMono(
                                fontSize: 10,
                                color: accentColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 18),
                      ...exp.responsibilities.map(
                        (item) => Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '▹ ',
                                style: TextStyle(
                                  color: accentColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: AppColors.textSecondary,
                                    height: 1.5,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          )
          .toList(),
    );
  }
}
