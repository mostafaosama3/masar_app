part of 'create_bootcamp_screen.dart';

mixin _BootcampFields on State<CreateBootcampScreen> {
  int get _step;
  set _step(int value);

  // ───────────────────────────── Field builders ─────────────────────────────

  Widget _reviewHeader(String title) {
    return Row(
      children: [
        Expanded(child: Text(title, style: _introTitle)),
        TextButton(onPressed: () => setState(() => _step = 0), child: const Text('Edit')),
      ],
    );
  }

  Widget _textField(
    String label,
    TextEditingController controller, {
    int maxLines = 1,
    TextInputType? keyboard,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _Label(label),
        Padding(
          padding: const EdgeInsets.only(bottom: 2),
          child: TextFormField(
            controller: controller,
            maxLines: maxLines,
            keyboardType: keyboard,
            validator: validator,
            style: const TextStyle(fontSize: 12),
            decoration: _fieldDecoration(vertical: 13),
          ),
        ),
      ],
    );
  }

  Widget _dropdown(
    String label,
    String? value,
    List<String> items,
    ValueChanged<String> onChanged, {
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _Label(label),
        DropdownButtonFormField<String>(
          initialValue: value,
          isExpanded: true,
          validator: validator,
          hint: Text(
            'Select ${label.replaceAll(' *', '')}',
            style: const TextStyle(fontSize: 12),
            overflow: TextOverflow.ellipsis,
          ),
          items: [
            for (final item in items)
              DropdownMenuItem(
                value: item,
                child: Text(
                  item,
                  style: const TextStyle(fontSize: 12),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
          ],
          onChanged: (v) {
            if (v != null) {
              setState(() => onChanged(v));
            }
          },
          decoration: _fieldDecoration(vertical: 3),
        ),
      ],
    );
  }
}
