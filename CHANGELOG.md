## [0.3.2] - [2021-01-14].

* Fix defualt `TextStyle` issue

## [0.3.1] - [2020-11-29].

* Change `ColorOption` widget's border width

## [0.3.0] - [2020-11-27].

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

## [0.2.1] - [2020-11-14].

* Remove unused imports

## [0.2.0] - [2020-11-14].

* New design to select font family
* Improve performance

## [0.1.3] - [2020-10-02].

* Set default text alignment

## [0.1.2] - [2020-08-24].

* Set default font size

## [0.1.1] - [2020-08-21].

* Fix `TextAlignment` initialization

## [0.1.0+2] - [2020-08-20].

* Add documentations

## [0.1.0+1] - [2020-08-19].

* Add documentations

## [0.1.0] - [2020-08-19].

* First virsion of `TextEditor`.
