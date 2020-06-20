import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:test/test.dart';
import 'package:assimp/assimp.dart';
import '../lib/src/bindings.dart';
import 'test_utils.dart';

// DO NOT EDIT (generated by tool/testgen)

void main() {
  prepareTest();

  test('size', () {
    expect(sizeOf<aiScene>(), equals(128));
  });

  test('null', () {
    testScene(null, tester: (scene) {
      expect(scene.flags, isZero);
      expect(scene.rootNode, isNullPointer);
      expect(scene.meshes, isEmpty);
      expect(scene.materials, isEmpty);
      expect(scene.animations, isEmpty);
      expect(scene.textures, isEmpty);
      expect(scene.lights, isEmpty);
      expect(scene.cameras, isEmpty);
      expect(scene.metaData, isNullPointer);
    });
  });

  test('3mf', () {
    testScene('3mf/box.3mf', tester: (scene) {
      expect(scene.flags, isZero);
      expect(scene.rootNode, isNotNull);
      expect(scene.meshes.length, equals(1));
      expect(scene.materials.length, equals(1));
      expect(scene.animations.length, isZero);
      expect(scene.textures.length, isZero);
      expect(scene.lights.length, isZero);
      expect(scene.cameras.length, isZero);
      expect(scene.metaData, isNullPointer);
    });
    testScene('3mf/spider.3mf', tester: (scene) {
      expect(scene.flags, isZero);
      expect(scene.rootNode, isNotNull);
      expect(scene.meshes.length, equals(19));
      expect(scene.materials.length, equals(4));
      expect(scene.animations.length, isZero);
      expect(scene.textures.length, isZero);
      expect(scene.lights.length, isZero);
      expect(scene.cameras.length, isZero);
      expect(scene.metaData, isNullPointer);
    });
  });

  test('fbx', () {
    testScene('fbx/huesitos.fbx', tester: (scene) {
      expect(scene.flags, isZero);
      expect(scene.rootNode, isNotNull);
      expect(scene.meshes.length, equals(1));
      expect(scene.materials.length, equals(1));
      expect(scene.animations.length, equals(1));
      expect(scene.textures.length, isZero);
      expect(scene.lights.length, equals(1));
      expect(scene.cameras.length, equals(1));
      expect(scene.metaData, isNotNull);
    });
  });

  test('obj', () {
    testScene('Obj/Spider/spider.obj', tester: (scene) {
      expect(scene.flags, isZero);
      expect(scene.rootNode, isNotNull);
      expect(scene.meshes.length, equals(19));
      expect(scene.materials.length, equals(6));
      expect(scene.animations.length, isZero);
      expect(scene.textures.length, isZero);
      expect(scene.lights.length, isZero);
      expect(scene.cameras.length, isZero);
      expect(scene.metaData, isNullPointer);
    });
  });

}
