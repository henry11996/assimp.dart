/*
---------------------------------------------------------------------------
Open Asset Import Library (assimp)
---------------------------------------------------------------------------

Copyright (c) 2006-2019, assimp team



All rights reserved.

Redistribution and use of this software in source and binary forms,
with or without modification, are permitted provided that the following
conditions are met:

* Redistributions of source code must retain the above
  copyright notice, this list of conditions and the
  following disclaimer.

* Redistributions in binary form must reproduce the above
  copyright notice, this list of conditions and the
  following disclaimer in the documentation and/or other
  materials provided with the distribution.

* Neither the name of the assimp team, nor the names of its
  contributors may be used to endorse or promote products
  derived from this software without specific prior
  written permission of the assimp team.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
"AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
---------------------------------------------------------------------------
*/

import 'dart:ffi';

import 'package:ffi/ffi.dart';

import 'bindings.dart';
import 'extensions.dart';

class Texel {
  Pointer<aiTexel> _ptr;

  Texel._(this._ptr);
  factory Texel.fromNative(Pointer<aiTexel> ptr) {
    if (AssimpPointer.isNull(ptr)) return null;
    return Texel._(ptr);
  }

  int get b => _ptr.ref.b;
  int get g => _ptr.ref.g;
  int get r => _ptr.ref.r;
  int get a => _ptr.ref.a;
}

class Texture {
  Pointer<aiTexture> _ptr;

  Texture._(this._ptr);
  factory Texture.fromNative(Pointer<aiTexture> ptr) {
    if (AssimpPointer.isNull(ptr)) return null;
    return Texture._(ptr);
  }

  int get width => _ptr.ref.mWidth;
  int get height => _ptr.ref.mHeight;

  Iterable<Texel> get data {
    return Iterable.generate(
      _ptr.ref.mWidth * _ptr.ref.mHeight,
      (i) => Texel.fromNative(_ptr.ref.pcData.elementAt(i)),
    );
  }

  String get formatHint => Utf8.fromUtf8(_ptr.ref.achFormatHint);
  String get fileName => AssimpString.fromNative(_ptr.ref.mFilename);
}
