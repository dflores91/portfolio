import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/core/theme/app_colors.dart';

class IdeMockup extends StatelessWidget {
  const IdeMockup({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardSurface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.cardBorder, width: 1),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: DecoratedBox(
          decoration: const BoxDecoration(
            border: Border(
              left: BorderSide(color: AppColors.primary, width: 4),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildWindowControls(),
                const SizedBox(height: 20),
                _buildCodeSnippet(),
                const SizedBox(height: 24),
                _buildHealthBar(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildWindowControls() {
    return Row(
      children: [
        _buildDot(AppColors.error),
        const SizedBox(width: 8),
        _buildDot(AppColors.tertiary),
        const SizedBox(width: 8),
        _buildDot(AppColors.primary),
      ],
    );
  }

  Widget _buildDot(Color color) {
    return Container(
      width: 12,
      height: 12,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }

  Widget _buildCodeSnippet() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _comment('// Configuración del Sistema v2.4.0'),
        const SizedBox(height: 8),
        _line([
          _token('final ', AppColors.tertiary),
          _token('mobileTechLead = ', AppColors.primary),
          _token('FlutterSpecialist(', AppColors.secondary),
        ]),
        _indentLine('architecture', ['CleanArch', 'SystemDesign']),
        _indentLine('stateManagement', ['BLoC', 'Riverpod', 'Provider']),
        _indentLine('iotHardware', ['BLE', 'GATT', 'NativeChannels']),
        _indentLine('devopsCI', ['Codemagic', 'AppStore', 'PlayConsole']),
        _indentLine('testing', ['Mocktail', 'BlocTest']),
        _indentLine('aiAssisted', ['Facades', 'Cubits', 'UnitTests']),
        _token(');', AppColors.textPrimary),
        const SizedBox(height: 12),
        _comment('// Logs: [OK] Clean Architecture validada'),
        _comment('// Logs: [OK] CI Codemagic multi-ambiente aprobado'),
      ],
    );
  }

  Widget _comment(String text) {
    return Text(
      text,
      style: GoogleFonts.jetBrainsMono(
        fontSize: 12,
        color: AppColors.textMuted.withValues(alpha: 0.6),
      ),
    );
  }

  Widget _line(List<Widget> tokens) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Wrap(children: tokens),
    );
  }

  Widget _indentLine(String key, List<String> values) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 2, bottom: 2),
      child: Wrap(
        children: [
          _token('$key: [', AppColors.primary),
          for (int i = 0; i < values.length; i++) ...[
            _token(values[i], AppColors.textPrimary),
            if (i < values.length - 1) _token(', ', AppColors.textMuted),
          ],
          _token('],', AppColors.primary),
        ],
      ),
    );
  }

  Widget _token(String text, Color color) {
    return Text(
      text,
      style: GoogleFonts.jetBrainsMono(
        fontSize: 13,
        color: color,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _buildHealthBar() {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: AppColors.cardBorder, width: 1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Estado del Sistema',
                style: GoogleFonts.jetBrainsMono(
                  fontSize: 12,
                  color: AppColors.textSecondary,
                ),
              ),
              Text(
                'Óptimo 100%',
                style: GoogleFonts.jetBrainsMono(
                  fontSize: 12,
                  color: AppColors.primary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            height: 6,
            decoration: BoxDecoration(
              color: AppColors.cardSurfaceHigh,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              const Icon(Icons.verified, size: 16, color: AppColors.primary),
              const SizedBox(width: 6),
              Text(
                'v2.4.0_CLEAN',
                style: GoogleFonts.jetBrainsMono(
                  fontSize: 11,
                  color: AppColors.textMuted,
                  letterSpacing: 0.8,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
