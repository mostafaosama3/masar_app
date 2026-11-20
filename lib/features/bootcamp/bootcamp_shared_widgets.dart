part of 'create_bootcamp_screen.dart';

// ───────────────────────────── Shared bits ─────────────────────────────

const _introTitle = TextStyle(fontSize: 15, fontWeight: FontWeight.w800);

const _fieldBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(11)),
  borderSide: BorderSide(color: LightPalette.borderColor),
);

InputDecoration _fieldDecoration({required double vertical}) => InputDecoration(
  border: _fieldBorder,
  enabledBorder: _fieldBorder,
  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: vertical),
  filled: true,
  fillColor: Colors.white,
);

class _StepIntro extends StatelessWidget {
  const _StepIntro(this.title, this.subtitle);

  final String title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: _introTitle),
        const Gap(9),
        Text(subtitle, style: const TextStyle(color: LightPalette.greyColor, fontSize: 12)),
        const Gap(17),
      ],
    );
  }
}

class _Label extends StatelessWidget {
  const _Label(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 7),
      child: Text(text, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w700)),
    );
  }
}

class _Notice extends StatelessWidget {
  const _Notice(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(color: _tint, borderRadius: BorderRadius.circular(12)),
      child: Text(
        text,
        style: const TextStyle(color: LightPalette.secondaryColor, fontSize: 11, height: 1.45),
      ),
    );
  }
}

/// A tappable box that looks like a text field (used for dates and times).
class _PickerField extends StatelessWidget {
  const _PickerField(this.label, this.value, this.icon, this.onTap);

  final String label, value;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _Label(label),
        InkWell(
          onTap: onTap,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: LightPalette.borderColor),
              borderRadius: BorderRadius.circular(11),
            ),
            child: Row(
              children: [
                Expanded(child: Text(value, style: const TextStyle(fontSize: 12))),
                Icon(icon, size: 15, color: LightPalette.greyColor),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _ReviewCard extends StatelessWidget {
  const _ReviewCard(this.rows);

  final List<(String, String)> rows;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: LightPalette.borderColor),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (final (label, value) in rows)
            Padding(
              padding: const EdgeInsets.only(bottom: 9),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w800)),
                  const Gap(3),
                  Text(
                    value,
                    style: const TextStyle(
                      fontSize: 10,
                      color: LightPalette.greyColor,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
