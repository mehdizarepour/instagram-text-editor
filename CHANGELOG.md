## 0.7.0

* Remove provider package

## 0.6.0

* Upgrade provider package to `6.0.1`

## 0.5.0

* Add text background color feature
* Fix issue #6

## 0.4.1

* Add `minFontSize` and `maxFontSize` props
* Fix issue #7

## 0.4.0+1

* Edit docs.

## 0.4.0

* Stable migrate to `null safety`.

## 0.4.0-nullsafety.0

* Migrate to `null safety`.
* Upgrade provider package to `5.0.0`

## 0.3.2

* Fix defualt `TextStyle` issue

## 0.3.1

* Change `ColorOption` widget's border width

## 0.3.0

* Add `decoration` property to customize editor design

```diff
TextEditor(
    fonts: fonts,
    text: text,
    textStyle: textStyle,
    textAlingment: textAlign,
+   decoration: EditorDecoration(
+     doneButton: Icon(Icons.close, color: Colors.white),
+     fontFamily: Icon(Icons.title, color: Colors.white),
+     colorPalette: Icon(Icons.palette, color: Colors.white),
+     alignment: AlignmentDecoration(
+       left: Text(
+         'left',
+         style: TextStyle(color: Colors.white),
+       ),
+       center: Text(
+         'center',
+         style: TextStyle(color: Colors.white),
+       ),
+       right: Text(
+         'right',
+         style: TextStyle(color: Colors.white),
+       ),
+     ),
+   ),
),
```

* Add `paletteColors` property to customize palette's colors

```diff
TextEditor(
    fonts: fonts,
    text: text,
    textStyle: textStyle,
    textAlingment: textAlign,
+   paletteColors: [
+      Colors.black,
+      Colors.white,
+      Colors.blue,
+      Colors.red,
+      Colors.green,
+      Colors.yellow,
+      Colors.pink,
+      Colors.cyanAccent,
+   ],
),
```

## 0.2.1

* Remove unused imports

## 0.2.0

* New design to select font family
* Improve performance

## 0.1.3

* Set default text alignment

## 0.1.2

* Set default font size

## 0.1.1

* Fix `TextAlignment` initialization

## 0.1.0+2

* Add documentations

## 0.1.0+1

* Add documentations

## 0.1.0

* First virsion of `TextEditor`.
