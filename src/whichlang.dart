import 'dart:html';

class CodeBlock {
  String? langName;
  List<String>? langIcon;
  IconType? iconType;
  String? filepath;

  CodeBlock(this.langName, this.langIcon, this.iconType, this.filepath);

  CodeBlock.fromClasses(Iterable<String> classes) {
    var forceCurrentLang = false;

    for (final cls in classes) {
      if (!forceCurrentLang) langName ??= langByHljsClass(cls);

      final match = keyValuePattern.firstMatch(cls);
      if (match != null) {
        final key = match.namedGroup('key')!;
        final value = match.namedGroup('value')!;
        switch (key) {
          case 'icon':
            var iconName;

            iconName = value.replaceFirst(RegExp(r'^\.'), '');
            if (iconName != value) {
              iconType = IconType.classNames;
              langIcon = iconName.split('.');
              break;
            }

            iconName = value.replaceFirst(RegExp(r'^@'), '');
            if (iconName != value) {
              iconType = IconType.url;
              langIcon = [iconName];
              break;
            }

          case 'lang':
            langName = value;

          case 'filepath':
            filepath = value;
        }
      } else {
        switch (cls) {
          case 'nolang':
            langName = null;
            forceCurrentLang = true;
        }
      }
    }
  }

  bool anySet() {
    return [langName, langIcon, iconType, filepath].any((e) => e != null);
  }

  String toString() {
    return 'CodeBlock(langName: $langName, langIcon: $langIcon, iconType: $iconType, filepath: $filepath)';
  }
}

enum IconType { url, classNames }

final hljsLangPattern = RegExp(r'^language-');
final keyValuePattern = RegExp(r'(?<key>.*?)=(?<value>.*)');

/// Transforms language names which are not manually set with `lang=`.
String transformLangName(String name) {
  return name.toUpperCase();
}

/// `highlightjs` assigns (multiple) classes of the form `language-x` to code blocks.
/// With that we can find out which language or family member of that language has been
/// specified in the Markdown code block.
String? langByHljsClass(String className) {
  final String name = className.replaceFirst(hljsLangPattern, '');
  if (className == name) {
    return null;
  }
  return transformLangName(name);
}

/// Inserts a `div` with class `wl-codeblockheader` in front of each `pre` element which should
/// be the parent element of `codeBlockElement`. When a language or an icon is defined, both of
/// these are wrapped within a `div` with the class `wl-langinfo`. Next to that element there may
/// be a `i` or `svg` which represents the icon.
void modifyCodeBlock(Element codeBlockElement, CodeBlock codeBlockData) {
  if (!codeBlockData.anySet()) return;

  var codeBlockHeader = document.createElement('div');
  codeBlockHeader.classes.add('wl-codeblockheader');

  var langInfo = document.createElement('div');
  langInfo.classes.add('wl-langinfo');

  final pre = codeBlockElement.parent;
  if (pre == null) {
    return;
  }
  pre.before(codeBlockHeader);

  // icon
  if (codeBlockData.langIcon != null) {
    var langIcon = null;
    switch (codeBlockData.iconType!) {
      case IconType.classNames:
        langIcon = document.createElement('i');
        langIcon.classes.add('wl-icon');
        codeBlockData.langIcon!.forEach((e) => langIcon.classes.add(e));
        langInfo.append(langIcon);

      case IconType.url:
        var image = document.createElement('img');
        image.setAttribute('src', codeBlockData.langIcon!.first);
        langInfo.append(image);
    }
  }

  // language name
  if (codeBlockData.langName != null) {
    var langName = document.createElement('span');
    langName.classes.add('wl-lang-name');
    langName.appendText(codeBlockData.langName!);
    langInfo.append(langName);
  }

  if (langInfo.hasChildNodes()) codeBlockHeader.append(langInfo);

  // filepath
  if (codeBlockData.filepath != null) {
    var filepath = document.createElement('span');
    filepath.classes.add('wl-filepath');
    filepath.appendText(codeBlockData.filepath!);
    codeBlockHeader.append(filepath);
  }
}

void main() {
  final codeBlocks = Map<Element, CodeBlock>.fromIterable(
      document.querySelectorAll('pre > code').map(
          (codeBlock) => (codeBlock, CodeBlock.fromClasses(codeBlock.classes))),
      key: (item) => item.$1,
      value: (item) => item.$2);

  codeBlocks.entries.forEach((e) => modifyCodeBlock(e.key, e.value));
}
