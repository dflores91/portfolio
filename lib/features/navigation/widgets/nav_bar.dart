import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/core/constants/app_data.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/utils/responsive_layout.dart';
import 'package:portfolio/features/navigation/cubit/navigation_cubit.dart';

class NavBar extends StatelessWidget implements PreferredSizeWidget {
  const NavBar({
    super.key,
    required this.onSectionTap,
  });

  final void Function(NavigationSection section) onSectionTap;

  @override
  Size get preferredSize => const Size.fromHeight(72);

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = ResponsiveLayout.isDesktop(context);

    return Container(
      height: 72,
      padding: EdgeInsets.symmetric(horizontal: isDesktop ? 48 : 20),
      decoration: BoxDecoration(
        color: AppColors.background.withValues(alpha: 0.95),
        border: const Border(
          bottom: BorderSide(color: AppColors.cardBorder, width: 1),
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(child: _buildBrand()),
              if (isDesktop)
                Row(
                  children: [
                    _buildNavItem(context, 'Proyectos', NavigationSection.projects),
                    const SizedBox(width: 12),
                    _buildNavItem(context, 'Experiencia', NavigationSection.journey),
                    const SizedBox(width: 12),
                    _buildNavItem(context, 'Habilidades', NavigationSection.skills),
                    const SizedBox(width: 12),
                    _buildNavItem(context, 'Educación', NavigationSection.education),
                    const SizedBox(width: 24),
                    _buildConnectButton(context),
                  ],
                )
              else
                IconButton(
                  icon: const Icon(Icons.menu, color: AppColors.textPrimary),
                  onPressed: () => _openMobileMenu(context),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBrand() {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => onSectionTap(NavigationSection.about),
        child: Text(
          AppData.brandName,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.outfit(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w700,
            fontSize: 20,
            letterSpacing: -0.5,
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(
    BuildContext context,
    String label,
    NavigationSection section,
  ) {
    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state) {
        final bool isActive = state.activeSection == section;
        return _NavButton(
          label: label,
          isActive: isActive,
          onTap: () => onSectionTap(section),
        );
      },
    );
  }

  Widget _buildConnectButton(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state) {
        final bool isActive = state.activeSection == NavigationSection.contact;
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: AppColors.surfaceContainerLowest,
            elevation: isActive ? 4 : 0,
            shadowColor: isActive ? AppColors.primary.withValues(alpha: 0.5) : Colors.transparent,
            side: isActive ? const BorderSide(color: AppColors.primaryContainer, width: 1.5) : BorderSide.none,
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          onPressed: () => onSectionTap(NavigationSection.contact),
          child: Text(
            'Contacto',
            style: GoogleFonts.jetBrainsMono(
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ),
          ),
        );
      },
    );
  }

  void _openMobileMenu(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: AppColors.cardSurface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: const Icon(Icons.dashboard_outlined, color: AppColors.primary),
                  title: const Text('Proyectos'),
                  onTap: () {
                    Navigator.pop(context);
                    onSectionTap(NavigationSection.projects);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.work_outline, color: AppColors.primary),
                  title: const Text('Experiencia'),
                  onTap: () {
                    Navigator.pop(context);
                    onSectionTap(NavigationSection.journey);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.code, color: AppColors.primary),
                  title: const Text('Habilidades'),
                  onTap: () {
                    Navigator.pop(context);
                    onSectionTap(NavigationSection.skills);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.school_outlined, color: AppColors.primary),
                  title: const Text('Educación'),
                  onTap: () {
                    Navigator.pop(context);
                    onSectionTap(NavigationSection.education);
                  },
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: AppColors.surfaceContainerLowest,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      onSectionTap(NavigationSection.contact);
                    },
                    child: Text(
                      'Contacto',
                      style: GoogleFonts.jetBrainsMono(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
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

class _NavButton extends StatefulWidget {
  const _NavButton({
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  final String label;
  final bool isActive;
  final VoidCallback onTap;

  @override
  State<_NavButton> createState() => _NavButtonState();
}

class _NavButtonState extends State<_NavButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final Color textColor = widget.isActive || _isHovered
        ? AppColors.primary
        : AppColors.textSecondary;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: widget.isActive
                ? AppColors.primary.withValues(alpha: 0.1)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            widget.label,
            style: GoogleFonts.jetBrainsMono(
              color: textColor,
              fontWeight: widget.isActive ? FontWeight.w700 : FontWeight.w500,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
