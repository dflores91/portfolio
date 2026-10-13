import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/core/constants/app_data.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/utils/responsive_layout.dart';
import 'package:portfolio/core/utils/url_helper.dart';
import 'package:portfolio/features/hero/presentation/ide_mockup.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({
    super.key,
    required this.onProjectsTap,
    required this.onContactTap,
  });

  final VoidCallback onProjectsTap;
  final VoidCallback onContactTap;

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = ResponsiveLayout.isDesktop(context);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 48 : 24,
        vertical: isDesktop ? 90 : 48,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: isDesktop
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(flex: 7, child: _buildContent(context)),
                    const SizedBox(width: 48),
                    const Expanded(flex: 5, child: IdeMockup()),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildContent(context),
                    const SizedBox(height: 48),
                    const IdeMockup(),
                  ],
                ),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    final bool isMobile = ResponsiveLayout.isMobile(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLocationBadge(isMobile),
        const SizedBox(height: 24),
        Text(
          AppData.fullName,
          style: GoogleFonts.outfit(
            fontSize: isMobile ? 36 : 64,
            fontWeight: FontWeight.w800,
            color: AppColors.textPrimary,
            letterSpacing: -1.2,
            height: 1.05,
          ),
        ),
        Text(
          AppData.lastName,
          style: GoogleFonts.outfit(
            fontSize: isMobile ? 36 : 64,
            fontWeight: FontWeight.w800,
            color: AppColors.primary,
            letterSpacing: -1.2,
            height: 1.05,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          AppData.title,
          style: TextStyle(
            fontSize: isMobile ? 18 : 20,
            fontWeight: FontWeight.w600,
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: 18),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 580),
          child: Text(
            AppData.heroDescription,
            style: const TextStyle(
              fontSize: 16,
              color: AppColors.textSecondary,
              height: 1.6,
            ),
          ),
        ),
        const SizedBox(height: 32),
        _buildStatsRow(isMobile),
        const SizedBox(height: 36),
        _buildActionButtons(isMobile),
      ],
    );
  }

  Widget _buildLocationBadge(bool isMobile) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: AppColors.primary.withValues(alpha: 0.25),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 7,
            height: 7,
            decoration: const BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              AppData.location.toUpperCase(),
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.jetBrainsMono(
                color: AppColors.primary,
                fontSize: isMobile ? 10 : 11,
                fontWeight: FontWeight.w600,
                letterSpacing: isMobile ? 0.6 : 1.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsRow(bool isMobile) {
    if (isMobile) {
      return Wrap(
        spacing: 24,
        runSpacing: 16,
        children: [
          _buildStatItem('6+', 'Años de Experiencia', AppColors.primary),
          _buildStatItem('4+', 'Despliegues Empresariales', AppColors.tertiary),
          _buildStatItem('IA', 'Flujos Asistidos', AppColors.secondary),
        ],
      );
    }

    return Row(
      children: [
        _buildStatItem('6+', 'Años de Experiencia', AppColors.primary),
        const SizedBox(width: 32),
        _buildStatItem('4+', 'Despliegues Empresariales', AppColors.tertiary),
        const SizedBox(width: 32),
        _buildStatItem('IA', 'Flujos Asistidos', AppColors.secondary),
      ],
    );
  }

  Widget _buildStatItem(String value, String label, Color valueColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w800,
            color: valueColor,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label.toUpperCase(),
          style: GoogleFonts.jetBrainsMono(
            fontSize: 11,
            color: AppColors.textMuted,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons(bool isMobile) {
    return Wrap(
      spacing: 16,
      runSpacing: 12,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: AppColors.surfaceContainerLowest,
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 24 : 32,
              vertical: 16,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 0,
          ),
          onPressed: onProjectsTap,
          child: Text(
            'Ver Arquitectura',
            style: GoogleFonts.jetBrainsMono(
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColors.textPrimary,
            side: const BorderSide(color: AppColors.cardBorder, width: 1.2),
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 20 : 28,
              vertical: 16,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () => UrlHelper.openUrl(AppData.githubUrl),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const FaIcon(FontAwesomeIcons.github, size: 16),
              const SizedBox(width: 8),
              Flexible(
                child: Text(
                  'Repositorios GitHub',
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.jetBrainsMono(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(width: 6),
              const Icon(Icons.arrow_forward, size: 16),
            ],
          ),
        ),
      ],
    );
  }
}
