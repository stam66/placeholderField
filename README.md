# placeholderField widget
Current version: 1.0  
Special thanks to **@BerndN** for adding the polish by fixing issues with _animation_ and _traversalOn_.

**PlaceholderField** is a script widget that provides a text field that includes a placeholder text as user prompty that disappears on entering text and reappears of field is empty.
Optionally include a subtle animation when showing/hiding placeholder text.
Includes password functionality to obscure text with bullet points and a new control is made visible to show/hide password text.  
_Script widgets were introduced in LiveCode version 10 DP5 and this requires this version or higher._
<img width="350" alt="Screenshot 2023-12-19 at 10 35 33" src="https://github.com/stam66/placeholderField/assets/5677273/0f32d794-0c44-4e09-a38b-95b57b24e35b">

All properties are settable in the widget's Property Inspector. Documentation should appear in the Dictionary once loaded.

**Properties**
* _placeholderText_: the placeholder/hint text to show (default = "Placeholder text")
* _textContent_: the text the field contains, used when passwordField = true
* _normalTextColor_: textColor for user-entered text (default = 66,66,66)
* _normalTextStyle_: textStyle for user-entered text (default = "Plain")
* _textScaleFactor_: scales text relative to field height - defult = 0.4 (40% of the field's Height)
* _placeholderTextColor_: placeholder text's textColor (defualt = 170,170,170)
* _placeholderTextStyle_: placeholder text's textStyle (default = "Italic")
* _passwordField_: setting this to true obscures text with bullet ponts (default = false)
* _obscureText_: shows/hides text if passwordField = true (defuault = true)
* _bulletDelay_: slight delay from 0 to 500 ms in typed letter changing to bullet,like on iOS (default 150 ms)
* _animatedPlaceholder_: animates placeholder showing or hiding with moving in or out from the right (default = false)
* _animationDuration_: duration of animation of placeholder (default = 250 ms)
* _widgetBorderWidth_: the borderWidth of the text field (default = 2)
* _widgetBorderColor_: the borderColor of the text field (default = 66,66,66)
* _widgetBackroundColor_: the backgroundColor of the text field (default = 255,255,255)
* _widgetTraversalOn_: the traversalOn of the widget (default = true)
