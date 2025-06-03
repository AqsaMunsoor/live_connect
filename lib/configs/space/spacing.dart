// ignore_for_file: library_private_types_in_public_api

part of '../configs.dart';

class Space {
  static _H get x => _H();
  static _V get y => _V();
  static _Padding get p => _Padding();
  static _Margin get m => _Margin();
}

class _H {
  SizedBox get t04 => const SizedBox(width: 4);
  SizedBox get t06 => const SizedBox(width: 6);
  SizedBox get t08 => const SizedBox(width: 8);
  SizedBox get t12 => const SizedBox(width: 12);
  SizedBox get t16 => const SizedBox(width: 16);
  SizedBox get t24 => const SizedBox(width: 24);
  SizedBox get t32 => const SizedBox(width: 32);
  SizedBox get t40 => const SizedBox(width: 40);
  SizedBox get t48 => const SizedBox(width: 48);
  SizedBox get t56 => const SizedBox(width: 56);
  SizedBox get t64 => const SizedBox(width: 64);
  SizedBox get t72 => const SizedBox(width: 72);
  SizedBox get t80 => const SizedBox(width: 80);
  SizedBox get t88 => const SizedBox(width: 88);
  SizedBox get t96 => const SizedBox(width: 96);
  SizedBox get t104 => const SizedBox(width: 104);
  SizedBox get t112 => const SizedBox(width: 112);
  SizedBox get t120 => const SizedBox(width: 120);
  SizedBox get t128 => const SizedBox(width: 128);
  SizedBox get t136 => const SizedBox(width: 136);
  SizedBox get t144 => const SizedBox(width: 144);
  SizedBox get t152 => const SizedBox(width: 152);
  SizedBox get t160 => const SizedBox(width: 160);
  SizedBox get t168 => const SizedBox(width: 168);
}

class _V {
  SizedBox get t04 => const SizedBox(height: 4);
  SizedBox get t06 => const SizedBox(height: 6);
  SizedBox get t08 => const SizedBox(height: 8);
  SizedBox get t12 => const SizedBox(height: 12);
  SizedBox get t16 => const SizedBox(height: 16);
  SizedBox get t24 => const SizedBox(height: 24);
  SizedBox get t32 => const SizedBox(height: 32);
  SizedBox get t40 => const SizedBox(height: 40);
  SizedBox get t48 => const SizedBox(height: 48);
  SizedBox get t56 => const SizedBox(height: 56);
  SizedBox get t64 => const SizedBox(height: 64);
  SizedBox get t72 => const SizedBox(height: 72);
  SizedBox get t80 => const SizedBox(height: 80);
  SizedBox get t88 => const SizedBox(height: 88);
  SizedBox get t96 => const SizedBox(height: 96);
  SizedBox get t104 => const SizedBox(height: 104);
  SizedBox get t112 => const SizedBox(height: 112);
  SizedBox get t120 => const SizedBox(height: 120);
  SizedBox get t128 => const SizedBox(height: 128);
  SizedBox get t136 => const SizedBox(height: 136);
  SizedBox get t144 => const SizedBox(height: 144);
  SizedBox get t152 => const SizedBox(height: 152);
  SizedBox get t160 => const SizedBox(height: 160);
  SizedBox get t168 => const SizedBox(height: 168);
}

class _Padding {
  final vertical = _VerticalPadding();
  final horizontal = _HorizontalPadding();
  final top = _TopPadding();
  final bottom = _BottomPadding();
  final all = _AllPadding();

  EdgeInsets get screen =>
      const EdgeInsets.symmetric(vertical: 15, horizontal: 20);
  EdgeInsets get listView => const EdgeInsets.fromLTRB(16, 0, 16, 60);
}

class _VerticalPadding {
  EdgeInsets get t04 => const EdgeInsets.symmetric(vertical: 4);
  EdgeInsets get t06 => const EdgeInsets.symmetric(vertical: 6);
  EdgeInsets get t08 => const EdgeInsets.symmetric(vertical: 8);
  EdgeInsets get t12 => const EdgeInsets.symmetric(vertical: 12);
  EdgeInsets get t16 => const EdgeInsets.symmetric(vertical: 16);
  EdgeInsets get t24 => const EdgeInsets.symmetric(vertical: 24);
  EdgeInsets get t32 => const EdgeInsets.symmetric(vertical: 32);
  EdgeInsets get t40 => const EdgeInsets.symmetric(vertical: 40);
  EdgeInsets get t48 => const EdgeInsets.symmetric(vertical: 48);
  EdgeInsets get t56 => const EdgeInsets.symmetric(vertical: 56);
  EdgeInsets get t64 => const EdgeInsets.symmetric(vertical: 64);
  EdgeInsets get t72 => const EdgeInsets.symmetric(vertical: 72);
  EdgeInsets get t80 => const EdgeInsets.symmetric(vertical: 80);
  EdgeInsets get t88 => const EdgeInsets.symmetric(vertical: 88);
  EdgeInsets get t96 => const EdgeInsets.symmetric(vertical: 96);
  EdgeInsets get t104 => const EdgeInsets.symmetric(vertical: 104);
  EdgeInsets get t112 => const EdgeInsets.symmetric(vertical: 112);
  EdgeInsets get t120 => const EdgeInsets.symmetric(vertical: 120);
  EdgeInsets get t128 => const EdgeInsets.symmetric(vertical: 128);
  EdgeInsets get t136 => const EdgeInsets.symmetric(vertical: 136);
  EdgeInsets get t144 => const EdgeInsets.symmetric(vertical: 144);
  EdgeInsets get t152 => const EdgeInsets.symmetric(vertical: 152);
  EdgeInsets get t160 => const EdgeInsets.symmetric(vertical: 160);
  EdgeInsets get t168 => const EdgeInsets.symmetric(vertical: 168);
}

class _HorizontalPadding {
  EdgeInsets get t04 => const EdgeInsets.symmetric(horizontal: 4);
  EdgeInsets get t06 => const EdgeInsets.symmetric(horizontal: 6);
  EdgeInsets get t08 => const EdgeInsets.symmetric(horizontal: 8);
  EdgeInsets get t12 => const EdgeInsets.symmetric(horizontal: 12);
  EdgeInsets get t16 => const EdgeInsets.symmetric(horizontal: 16);
  EdgeInsets get t24 => const EdgeInsets.symmetric(horizontal: 24);
  EdgeInsets get t32 => const EdgeInsets.symmetric(horizontal: 32);
  EdgeInsets get t40 => const EdgeInsets.symmetric(horizontal: 40);
  EdgeInsets get t48 => const EdgeInsets.symmetric(horizontal: 48);
  EdgeInsets get t56 => const EdgeInsets.symmetric(horizontal: 56);
  EdgeInsets get t64 => const EdgeInsets.symmetric(horizontal: 64);
  EdgeInsets get t72 => const EdgeInsets.symmetric(horizontal: 72);
  EdgeInsets get t80 => const EdgeInsets.symmetric(horizontal: 80);
  EdgeInsets get t88 => const EdgeInsets.symmetric(horizontal: 88);
  EdgeInsets get t96 => const EdgeInsets.symmetric(horizontal: 96);
  EdgeInsets get t104 => const EdgeInsets.symmetric(horizontal: 104);
  EdgeInsets get t112 => const EdgeInsets.symmetric(horizontal: 112);
  EdgeInsets get t120 => const EdgeInsets.symmetric(horizontal: 120);
  EdgeInsets get t128 => const EdgeInsets.symmetric(horizontal: 128);
  EdgeInsets get t136 => const EdgeInsets.symmetric(horizontal: 136);
  EdgeInsets get t144 => const EdgeInsets.symmetric(horizontal: 144);
  EdgeInsets get t152 => const EdgeInsets.symmetric(horizontal: 152);
  EdgeInsets get t160 => const EdgeInsets.symmetric(horizontal: 160);
  EdgeInsets get t168 => const EdgeInsets.symmetric(horizontal: 168);
}

class _TopPadding {
  EdgeInsets get t04 => const EdgeInsets.only(top: 4);
  EdgeInsets get t06 => const EdgeInsets.only(top: 6);
  EdgeInsets get t08 => const EdgeInsets.only(top: 8);
  EdgeInsets get t12 => const EdgeInsets.only(top: 12);
  EdgeInsets get t16 => const EdgeInsets.only(top: 16);
  EdgeInsets get t24 => const EdgeInsets.only(top: 24);
  EdgeInsets get t32 => const EdgeInsets.only(top: 32);
  EdgeInsets get t40 => const EdgeInsets.only(top: 40);
  // ... Add more as needed
}

class _BottomPadding {
  EdgeInsets get t04 => const EdgeInsets.only(bottom: 4);
  EdgeInsets get t06 => const EdgeInsets.only(bottom: 6);
  EdgeInsets get t08 => const EdgeInsets.only(bottom: 8);
  EdgeInsets get t12 => const EdgeInsets.only(bottom: 12);
  EdgeInsets get t16 => const EdgeInsets.only(bottom: 16);
  EdgeInsets get t24 => const EdgeInsets.only(bottom: 24);
  EdgeInsets get t60 => const EdgeInsets.only(bottom: 60);
  EdgeInsets get t100 => const EdgeInsets.only(bottom: 100);
}

class _AllPadding {
  EdgeInsets get t04 => const EdgeInsets.all(4);
  EdgeInsets get t06 => const EdgeInsets.all(6);
  EdgeInsets get t08 => const EdgeInsets.all(8);
  EdgeInsets get t12 => const EdgeInsets.all(12);
  EdgeInsets get t16 => const EdgeInsets.all(16);
  EdgeInsets get t24 => const EdgeInsets.all(24);
  EdgeInsets get t32 => const EdgeInsets.all(32);
  EdgeInsets get t40 => const EdgeInsets.all(40);
  // ... Add more as needed
}

class _Margin {
  final vertical = _VerticalPadding();
  final horizontal = _HorizontalPadding();
  final top = _TopPadding();
  final bottom = _BottomPadding();
  final all = _AllPadding();

  EdgeInsets get card =>
      const EdgeInsets.symmetric(horizontal: 16, vertical: 10);
}
