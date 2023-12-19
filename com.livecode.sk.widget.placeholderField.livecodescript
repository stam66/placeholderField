script "com.livecode.sk.widget.placeholderField"

/**
Title: placeholderField

Author: Stam Kapetanakis
Version: 1.0
Type: Widget

SVGIcon: M213.156 273.312L213.156 301.344L304.469 301.344L304.469 273.312L213.156 273.312ZM217.656 277.844L224.281 277.844L224.281 284.656L226.281 284.656L226.281 277.844L232.938 277.844L232.938 296.844L226.281 296.844L226.281 288.875L224.281 288.875L224.281 296.844L217.656 296.844L217.656 277.844ZM235.594 277.844L242.25 277.844L242.25 296.844L235.594 296.844L235.594 277.844ZM244.906 277.844L250.469 277.844L254.188 286.406L254.188 277.844L259.75 277.844L259.75 296.844L253.938 296.844L250.469 288.219L250.469 296.844L244.906 296.844L244.906 277.844ZM261.281 277.844L275.812 277.844L275.812 281.656L271.875 281.656L271.875 296.844L265.219 296.844L265.219 281.656L261.281 281.656L261.281 277.844Z

Summary: Field with placeholder/hint text and password function.

Description:
A text field that includes a placeholder text as user prompty that disappears on entering text and reappears of field is empty.
Optionally include a subtle animation when showing/hiding placeholder text.
Includes password functionality to obscure text with bullet points and a new control is made visible to show/hide password text.

Properties:
placeholderText: the placeholder/hint text to show (default = "Placeholder text")
textContent: the text the field contains, used when passwordField = true
normalTextColor: textColor for user-entered text (default = 66,66,66)
normalTextStyle: textStyle for user-entered text (default = "Plain")
textScaleFactor: scales text relative to field height - defult = 0.4 (40% of the field's Height)
placeholderTextColor: placeholder text's textColor (defualt = 170,170,170)
placeholderTextStyle: placeholder text's textStyle (default = "Italic")
passwordField: setting this to true obscures text with bullet ponts (default = false)
obscureText: shows/hides text if passwordField = true (defuault = true)
bulletDelay: slight delay from 0 to 500 ms in typed letter changing to bullet,like on iOS (default 150 ms)
animatedPlaceholder: animates placeholder showing or hiding with moving in or out from the right (default = false)
animationDuration: duration of animation of placeholder (default = 250 ms)
widgetBorderWidth: the borderWidth of the text field (default = 2)
widgetBorderColor: the borderColor of the text field (default = 66,66,66)
widgetBackroundColor: the backgroundColor of the text field (default = 255,255,255)
widgetTraversalOn: the traversalOn of the widget (default = true)

*/

getProp propertyMetadata[pProperty]
    switch pProperty
        case "textContent"
            return {\
                  "default":"",\
                  "label":"Text content",\
                  "editor":"com.livecode.pi.text",\
                  "section":"contents"}
            break
        case "placeholderText"
            return { \
                  "default": "Placeholder text", \
                  "label": "Placeholder text", \
                  "editor": "com.livecode.pi.string", \
                  "section": "contents" }
            break
        case "textScaleFactor"
            return { \
                  "default": "0.4", \
                  "label": "Scale text height proportional to field height", \
                  "editor": "com.livecode.pi.number", \
                  "step":"0.1",\
                  "section": "text" }
            break
        case "normalTextStyle"
            return { \
                  "default": "Plain", \
                  "label": "textStyle for normal text", \
                  "editor": "com.livecode.pi.enum", \
                  "options": "Plain,Bold,Italic", \
                  "section": "text" }
            break
        case "placeholderTextStyle"
            return { \
                  "default": "Italic", \
                  "label": "textStyle for normal text", \
                  "editor": "com.livecode.pi.enum", \
                  "options": "Italic,Bold,Plain", \
                  "section": "text" }
            break
        case "normalTextColor" 
            return {\
                  "default":"66,66,66", \
                  "label": "Normal text color", \
                  "editor": "com.livecode.pi.color", \
                  "section": "colors"}
            break
        case "placeholderTextColor" 
            return {\
                  "default":"170,170,170", \
                  "label": "Placeholder text color", \
                  "editor": "com.livecode.pi.color", \
                  "section": "colors"}
            break
        case "animatedPlaceholder" 
            return {\
                  "default": "true", \
                  "label": "Animated placeholder", \
                  "editor": "com.livecode.pi.boolean", \
                  "section": "basic" }
            break
        case "animationDuration"
            return {\
                  "default": "250",\
                  "label" : "Speed (milliseconds) hiding placeholder",\
                  "editor": "com.livecode.pi.number", \
                  "step":"50",\
                  "section": "text"}
            break
        case "passwordField"
            return {\
                  "default": "false", \
                  "label":"Password field", \
                  "editor":"com.livecode.pi.boolean", \
                  "section": "basic"}
            break
        case "obscureText"
            return {\
                  "default":"False",\
                  "label":"Obscure password", \
                  "editor":"com.livecode.pi.boolean",\
                  "section":"contents"}
            break
        case "bulletDelay"
            return {\
                  "default": "150", \
                  "label": "Delay until char obscured", \
                  "editor":"com.livecode.pi.number", \
                  "step":"50",\
                  "section":"text"}
            break
        case "widgetBorderWidth"
            return {\
                  "default":"2", \
                  "label":"Border width", \
                  "editor":"com.livecode.pi.number", \
                  "step":"1",\
                  "section":"basic"}
            break
        case "widgetBorderColor"
            return {\
                  "default":"66,66,66",\
                  "label":"Border color", \
                  "editor":"com.livecode.pi.color",\
                  "section":"colors"}
            break
        case "widgetBackgroundColor"
            return {\
                  "default":"255,255,255", \
                  "label":"Background color", \
                  "editor":"com.livecode.pi.color", \
                  "section":"colors"}
            break
        case "widgetTraversalOn"
            return {\
                  "default":"true", \
                  "label":"The traversalOn of the widget", \
                  "editor":"com.livecode.pi.boolean", \
                  "section":"basic"}
            break
    end switch
end propertyMetadata

/////////// SCRIPT VARIABLES ////////// 
local sHasCreatedVisuals
local sTextID, sPlaceholderID, sDiscloseID
//////// END SCRIPT VARIALBES ///////

///////// PROPERTIES///////////
### TEXT FIELD ###
// textContent
/**
Type: Property

Summary: The text the user types into the widget

Syntax: get the textContent of <widget>
set the textContent of <widget> to tText

Example:put the textContent of widget "myWidget" into tText
set the textContent of widget "myWidget" to "text input"
Value: String or empty
Description: Use <textContent> to get or set the user-entered text
*/
getProp textContent
    return the textContent of me
end textContent

setProp textContent pText
    set the textContent of me to pText
    if the passwordField of me is false then
        set the text of control id sTextID to pText
        select after control id sTextID
        showHidePlaceholder
    end if
end textContent

// textScaleFactor
/**
Type: Property

Summary: Scales textHeight based on the widget's height. Resizing widget will resize text accordingly.

Syntax: get the textScaleFactor of <widget>
set the textScaleFactor of <widget> to tFloat

Example:put the textScaleFactor of widget "myWidget" into tFactor
set the textScaleFactor of widget "myWidget" to 0.4
Value: Decimal (float)  ranging 0.1 - 0.9
Description: Use <textScaleFactor> to determine the textHeight for given widget height
*/
getProp textScaleFactor
    if the textScaleFactor of me is empty then set the textScaleFactor of me to 0.4
    return the textScaleFactor of me
end textScaleFactor

setProp textScaleFactor pScale
    set the textScaleFactor of me to pScale
    updateVisualControls
end textScaleFactor

// normalTextStyle
/**
Type: Property

Summary: The text style of the user-entered text.

Syntax: get the normalTextStyle of <widget>
set the normalTextStyle of <widget> to Plain|Bold|Italic

Example: put the normalTextStyle of widget "myWidget" into tStyle
set the normalTextStyle of widget "myWidget" to "Plain"
Value: Enum (Plain|Bold|Italic)
Description: Use <normalTextStyle> to get/set the style of user entered text. Almost always this will be "Plain"
*/
getProp normalTextStyle
    if the normalTextStyle of me is empty then set the normalTextStyle of me to "Plain"
    return the normalTextStyle of me
end normalTextStyle

setProp normalTextStyle pStyle
    set the normalTextStyle of me to pStyle
    updateVisualControls
end normalTextStyle

// normalTextColor
/**
Type: Property

Summary: The text color of the user-entered text.

Syntax: get the normalTextColor of <widget>
set the normalTextColor of <widget> to RGB

Example: put the normalTextColor of widget "myWidget" into tColor
set the normalTextColor of widget "myWidget" to 66,66,66
Value: Any valid color
Description: Use <normalTextColor> to get/set the color of user entered text. Almost always this will be black or near-black (default is 66,66,66)
*/
getProp normalTextColor
    if the normalTextColor of me is empty then set the normalTextColor of me to 66,66,66
    return the normalTextColor of me
end normalTextColor

setProp normalTextColor pColor
    set the normalTextColor of me to pColor
    updateVisualControls
end normalTextColor



# PLACEHOLDER PROPERTIES
// placeholderText
/**
Type: Property

Summary: The placeholder/hint text that appears if the field is empty.

Syntax: get the placeholderText of <widget>
set the placeholderText of <widget> to "Placeholder text"

Example: put the placeholderText of widget "myWidget" into tText
set the placeholderText of widget "myWidget" to "Placeholder text"
Value: Text
Description: Use <placeholderText> to get/set the the text that shows with different color/style to user-entered text when field is empty.
*/
getProp placeholderText
    if the placeholderText of me is empty then set the placeholderText of me to  "Placeholder text" 
    return the placeholderText of me
end placeholderText

setProp placeholderText pText
    set the placeholderText of me to pText
    updateVisualControls
end placeholderText

// placeholderTextStyle
/**
Type: Property

Summary: The textStyle of the placeholder text

Syntax: get the placeholderTextStyle of <widget>
set the placeholderTextStyle of <widget> to Italic|Bold|Plain

Example: put the placeholderText of widget "myWidget" into tText
set the placeholderText of widget "myWidget" to "Italic"
Value: Enum (Italic|Bold|Plain)
Description: Use <placeholderTextStyle> to get/set the the textStyle of the placeholder text (default is "Italic")
*/
getProp placeholderTextStyle
    if the placeholderTextStyle of me is empty then set the placeholderTextStyle of me to "Italic"
    return the placeholderTextStyle of me
end placeholderTextStyle

setProp placeholderTextStyle pStyle
    set the placeholderTextStyle of me to pStyle
    updateVisualControls
end placeholderTextStyle

// placeholderTextColor
/**
Type: Property

Summary: The textColor of the placeholder text

Syntax: get the placeholderTextColor of <widget>
set the placeholderTextColor of <widget> to RGB

Example: put the placeholderText of widget "myWidget" into tColor
set the placeholderText of widget "myWidget" to 170,170,170
Value: Any valid color
Description: Use <placeholderTextColor> to get/set the the textColor of the placeholder text (default is 170,170,170)
*/
getProp placeholderTextColor
    if the placeholderTextColor of me is empty then set the placeholderTextColor of me to "170,170,170"
    return the placeholderTextColor of me 
end placeholderTextColor

setProp placeholderTextColor pColor
    set the placeholderTextColor of me to pColor
    updateVisualControls
end placeholderTextColor

### PASSWORD FIELD ###
// bulletDelay
/**
Type: Property

Summary: The delay in milliseconds in bulletpoints obscuring text characters when passwordField is true

Syntax: get the bulletDelay of <widget>
set the bulletDelay of <widget> to 250

Example: put the bulletDelay of widget "myWidget" into tDelay
set the bulletDelay of widget "myWidget" to 250
Value: Integer 
Description: Use <bulletDelay> to get/set the the delay in milliseconds in obscuring the typed characters with bulletpoints when the passwordField property of the widget is true and the text is obscured (default is 250 ms).
*/
getProp bulletDelay
    if the bulletDelay of me is empty then set the bulletDelay of me to 250
    return the bulletDelay of me
end bulletDelay

setProp bulletDelay pDelay
    set the bulletDelay of me to pDelay
end bulletDelay

// obscureText
/**
Type: Property

Summary: Boolean that determines whether the text should be obscured with bulletpoints or not, when the passwordField of the widget is true

Syntax: get the obscureText of <widget>
set the obscureText of <widget> to true|false

Example: put the obscureText of widget "myWidget" into tBool
set the obscureText of widget "myWidget" to false
Value: Boolean
Description: Use <obscureText> to obscure or show text when the password field of the widget is true
*/
getProp obscureText
    if the obscureText of me is empty then set the obscureText of me to false
    return the obscureText of me
end obscureText

setProp obscureText pBool
    set the obscureText of me to pBool
    updateVisualControls
end obscureText

// passwordField
/**
Type: Property

Summary: Boolean that determines whether the widget should behave as a password field.

Syntax: get the passwordField of <widget>
set the passwordField of <widget> to true|false

Example: put the passwordField of widget "myWidget" into tBool
set the passwordField of widget "myWidget" to true
Value: Boolean
Description: Use <passwordField> to create a password field: Text is obscured by bulletpoints after a configurable delay from typing. A new button appears to the right of the widget that will show or obscure the typed text.
*/
getProp passwordField
    if the passwordField of me is empty then set the passwordField of me to false
    return the passwordField of me
end passwordField

setProp passwordField pBool
    set the passwordField of me to pBool
    set the obscureText of me to pBool
    updateVisualControls
end passwordField

### ANIMATED PLACEHOLDER ###
// animatePlaceholder
/**
Type: Property

Summary: Boolean that determines whether the placeholder text disappears or reappears with animation.

Syntax: get the animatePlaceholder of <widget>
set the animatePlaceholder of <widget> to true|false

Example: put the animatePlaceholder of widget "myWidget" into tBool
set the animatePlaceholder of widget "myWidget" to true
Value: Boolean
Description: Use <animatePlaceholder> to animate showing/hiding placeholder text moving in from or out to the right respectively.
*/
getProp animatedPlaceholder
    if the animatedPlaceholder of me is empty then set the animatedPlaceholder of me to true
    return the animatedPlaceholder of me
end animatedPlaceholder

setProp animatedPlaceholder pBool
    set the animatedPlaceholder of me to pBool
end animatedPlaceholder

// animationDuration
/**
Type: Property

Summary: Boolean that determines whether the placeholder text disappears or reappears with animation.

Syntax: get the animatePlaceholder of <widget>
set the animatePlaceholder of <widget> to true|false

Example: put the animatePlaceholder of widget "myWidget" into tBool
set the animatePlaceholder of widget "myWidget" to true
Value: Boolean
Description: Use <animatePlaceholder> to animate showing/hiding placeholder text moving in from or out to the right respectively.
*/
getProp animationDuration
    if the animationDuration of me is empty then set the animationDuration of me to 250
    return the animationDuration of me
end animationDuration

setProp animationDuration pDuration
    set the animationDuration of me to pDuration
end animationDuration

### WIDGET PROPERTIES ###
// widgetBorderWidth
/**
Type: Property

Summary: Integer describing the field's borderWidth

Syntax: get the widgetBorderWidth of <widget>
set the widgetBorderWidth of <widget> to 2 

Example: put the widgetBorderWidth of widget "myWidget" into tWidth
set the widgetBorderWidth of widget "myWidget" to 3
Value: Integer 
Description: Get or set the borderWidth of the field of the widget.
*/
getProp widgetBorderWidth
    if the widgetBorderWidth of me is empty then set the widgetBorderWidth of me to 2
    return the widgetBorderWidth of me
end widgetBorderWidth

setProp widgetBorderWidth pWidth
    set the widgetBorderWidth of me to pWidth
    updateVisualControls
end widgetBorderWidth

// widgetBorderColor
/**
Type: Property

Summary: The field's borderColor

Syntax: get the widgetBorderColor of <widget>
set the widgetBorderColor of <widget> to 2

Example: put the widgetBorderColor of widget "myWidget" into tColor
set the widgetBorderColor of widget "myWidget" to 66,66,66
Value: Color 
Description: Get or set the borderColor of the field of the widget.
*/
getProp widgetBorderColor
    if the widgetBorderColor of me is empty then set the widgetBorderColor of me to 66,66,66 
    return the widgetBorderColor of me
end widgetBorderColor

setProp widgetBorderColor pColor
    set the widgetBorderColor of me to pColor
    updateVisualControls
end widgetBorderColor

// widgetBackgroundColor
/**
Type: Property

Summary: The field's backgroundColor

Syntax: get the widgetBackgroundColor of <widget>
set the widgetBackgroundColor of <widget> to 255,255,255

Example: put the widgetBackgroundColor of widget "myWidget" into tColor
set the widgetBackgroundColor of widget "myWidget" to 66,66,66
Value: Color 
Description: Get or set the backgroundColor of the field of the widget.
*/
getProp widgetBackgroundColor
    if the widgetBackgroundColor of me is empty then set the widgetBackgroundColor of me to 255,255,255
    return the widgetBackgroundColor of me
end widgetBackgroundColor

setProp widgetBackgroundColor pColor
    set the widgetBackgroundColor of me to pColor
    updateVisualControls
end widgetBackgroundColor

// widgetTraversalOn
/**
Type: Property

Summary: Boolean that determines the traversalOn of the widget

Syntax: get the widgetTraversalOn of <widget>
set the widgetTraversalOn of <widget> to true|false

Example: put the widgetTraversalOn of widget "myWidget" into tBool
set the widgetTraversalOn of widget "myWidget" to true
Value: Boolean
Description: Use <widgetTraversalOn> to set the traversalOn of the widget
*/
getProp widgetTraversalOn
    if the widgetTraversalOn of me is empty then set the widgetTraversalOn of me to true
    return the widgetTraversalOn of me
end widgetTraversalOn

setProp widgetTraversalOn pBool
   set the widgetTraversalOn of me to pBool
   setTraversalOn
end widgetTraversalOn
/////// END PROPERTIES/////////

///////////////  GROUP  ////////////////
command createVisualControls
    if not sHasCreatedVisuals then
        set the dontWrap of the templateField to true
        set the traversalOn of the templateField to true
        create field "text" in me
        put the id of it into sTextID
        
        set the traversalOn of the templateField to false
        set the threeD of the templateField to false
        set the lockText of the templateField to true
        set the dontWrap of the templateField to true
        set the showBorder of the templateField to false
        set the opaque of the templateField to false
        
        create field "placeholder" in me
        put the id of it into sPlaceholderID
        
        create invisible field "disclose" in me
        put the id of it into sDiscloseID
        set the opaque of field "disclose" of me to true -- added by @BerndN
        set the text of control id sDiscloseID to numToCodepoint(0x23FF)
        
        reset the templateField
        put true into sHasCreatedVisuals
    end if
end createVisualControls

command updateVisualControls
    local tFont
    // sTextID - text field for data entry
    set the textColor of control id sTextID to the normalTextColor of me
    set the textStyle of control id sTextID to the normalTextStyle of me
    set the textSize of control id sTextID to the height of control id sTextID * the textScaleFactor of me
    
    if the text of control id sTextID is not empty then  // in case set some other way
        if numToCodePoint(0x25CF) is not in control id sTextID and the text of control id sTextID <> the placeholderText of me then
            set the textContent of me to control id sTextID
        end if
    end if
    
    set the text of control id sTextID to the textContent of me
    centerTextVertically the long id of control id sTextID
    set the borderColor of control id sTextID to the widgetBorderColor of me
    set the borderWidth of control id sTextID to the widgetBorderWidth of me
    if the widgetBorderWidth of me <> 2 then
        set the threeD of control id sTextID to false
    else
        set the threeD of control id sTextID to true
    end if
    set the backgroundColor of control id sTextID to the widgetBackgroundColor of me
    
    put the textFont of me into tFont
    if tFont is not empty then
        set the textFont of control id sTextID to tFont
        set the textFont of control id sPlaceholderID to tFont
    end if
    // sPlaceholderID - label field for placeholder
    set the text of control id sPlaceholderID to the placeholderText of me
    set the textSize of control id sPlaceholderID to the textSize of control id sTextID
    set the textStyle of control id sPlaceholderID to the placeholderTextStyle of me
    set the textColor of control id sPlaceholderID to the placeholderTextColor of me
    set the rect of control id sPlaceholderID to the rect of control id sTextID
    set the textSize of control id sPlaceholderID to the textSize of control id sTextID
    set the margins of control id sPlaceholderID to the margins of control id sTextID
    
    showHidePlaceholder
    showHideText
    resizeFields
end updateVisualControls

command setTraversalOn
    set the traversalOn of the owner of me to the widgetTraversalOn of me -- modified by @BerndN
end setTraversalOn

command resizeFields
    local tFieldRect, tLabelRect, tDisclose
    hide control id sDiscloseID
    put the rect of me into tFieldRect
    
    if the passwordField of me then 
        put item 4 of tFieldRect - item 2 of tFieldRect into tDisclose // the height/width of disclose button-field
        subtract 2+tDisclose/2 from item 3 of tFieldRect
    end if
    
    // text field
    set the rect of control id sTextID to tFieldRect
    set the textSize of control id sTextID to the height of control id sTextID * the textScaleFactor of me
    centerTextVertically the long id of control id sTextID
    // label field
    set the rect of control id sPlaceholderID to tFieldRect
    set the textSize of control id sPlaceholderID to the textSize of control id sTextID
    set the margins of control id sPlaceholderID to the margins of control id sTextID
    // disclose field-button -- if the passwordField of me is true
    if the passwordField of me then 
        set the text of control id sDiscloseID to numToCodepoint(0x23FF )
        set the height of control id sDiscloseID to tDisclose
        set the width of control id sDiscloseID to tDisclose/2
        set the textSize of control id sDiscloseID to the textSize of control id sTextID * 2 // fudge for unicode icon
        set the margins of control id sDiscloseID to the margins of control id sTextID
        set the leftmargin of control id sDiscloseID to 2
        
        // topMargin needs fudging to account fo the *2 size of the unicode icon
        centerTextVertically the long id of control id sDiscloseID
        set the topMargin of control id sDiscloseID to (the topMargin of control id sDiscloseID/4 - 2)
        
        set the loc of control id sDiscloseID to the loc of control id sTextID
        set the left of control id sDiscloseID to the right of control id sTextID + 2 // needs distance or the focus ring is affected
        showHideText
        show control id sDiscloseID
    end if
end resizeFields
/////////////  END GROUP  //////////////


///////////////  ACTIONS  ////////////////
on moveStopped -- added by @BerndN
    ## only field "placeholder" emits 'moveStopped' when used 'move without waiting'
    set the visible of the target to (the loc of the target is within the rect of control id sTextID)
end moveStopped

command showHidePlaceholder 
    # thanks to @BerndN  for fixing animation with the 'without waiting' variant of 'move'
    if fieldIsEmpty() then
        if the visible of control id sPlaceholderID then exit showHidePlaceholder
        // show placeholder
        if the animatedPlaceholder of me <> true then
            show control id sPlaceholderID
        else
            set the visible of control id sPlaceholderID to true
            move control id sPlaceholderID to the loc of control id sTextID in  the animationDuration of me milliseconds without waiting
        end if
    else
        if the visible of control id sPlaceholderID = false then exit showHidePlaceholder
        // hide placeholder
        if the animatedPlaceholder of me <> true then
            hide control id sPlaceholderID
        else
            move control id sPlaceholderID to item 1 of the loc of control id sTextID * 3, \
                  item 2 of the loc of control id sTextID in the animationDuration of me milliseconds without waiting
        end if
    end if
end showHidePlaceholder

command showHideText
    if the obscureText of me then
        set the textColor of control id sDiscloseID to the placeholderTextColor of me
        repeat with i = 1 to the number of chars of control id sTextID
            // 0x2022 - bullet point (too small), 0x25CF - black circle (best), 0x26AB - medium black circle (largest)
            put numToCodePoint(0x25CF) into char i of control id sTextID
        end repeat
    else
        set the textColor of control id sDiscloseID to the normalTextColor of me
        put the textContent of me into control id sTextID
    end if
end showHideText

command conceal // the unicode for the disclose button-field is 0x23FF
    set the obscureText of me to not the obscureText of me
    if the obscureText of me then
        set the textColor of control id sDiscloseID to 190,190,190
    else
        set the textColor of control id sDiscloseID to 66,66,66
    end if
end conceal

/**
Type: Message
Summary: <fieldAction> is dispatched when user exits or closes the field

Syntax: fieldAction pTextContent, pWidgetLongID
Example:on fieldAction pTextContent, pWidgetLongID
   //do code
   // pTextContent contains the user-entered text, pWidgetLongID identifies the widget
end fieldAction

Description: Implement <fieldAction> message to react to user exiting a field, within the widget's script editor. Upon emission it passes the text the user entered into the field and the long id of the emiting widget so i can be handled at higher level if needed.
*/

on fieldAction pTextContent, pWidgetLongID
    -- fake handler for dictionary entry on fieldAction emitted on closing/exiting the field
end fieldAction 
/////////////  END ACTIONS  /////////////


///////////////  EVENTS /////////////// 
on parentPropertyChanged
   updateVisualControls
end parentPropertyChanged

on openControl
    if not sHasCreatedVisuals then createVisualControls
    updateVisualControls
    resizeFields
    send "setTraversalOn" to me in 50 milliseconds  -- added by @BerndN
end openControl

on focusIn
    if the focusedObject = the long id of control id sTextID then select after control id sTextID
 end focusIn
 
on tabKey -- added by @BerndN
    lock messages
    pass tabKey
    unlock messages
end tabKey

on mouseDown
    if the short name of the target is "disclose" then
        set the textColor of control id sDiscloseID to 150,150,150
    else
        select after control id sTextID
        showHIdePlaceholder
    end if
end mouseDown

on mouseRelease
    if the short name of the target is "disclose" then
        if the obscureText of me then
            set the textColor of control id sDiscloseID to the placeholderTextColor of me
        else
            set the textColor of control id sDiscloseID to the normalTextColor of me
        end if
    end if
end mouseRelease

on mouseUp
    if the short name of the target is "disclose" then
        conceal
    end if
end mouseUp

on keyDown pKeyName
    local tChar
    
    if the obscureText of me then
        set the textContent of me to the textContent of me & pKeyName
    else
        set the textContent of me to the text of control id sTextID
    end if
    showHidePlaceholder
    pass keydown
end keyDown

on selectionChanged
    -- if text is obscured do not let user navigate to middle of string because 
    -- inserting there be appended rather than inserted, so best not let than happen
    local tCharCount, tSelectedChunk
    if the obscureText of me is false then exit selectionChanged
    put the number of chars of control id sTextID into tCharCount
    if tCharCount = 0 then exit selectionChanged   -- at this point we have an obscured field with at least 1 char
    put the selectedChunk into tSelectedChunk
    if word 2 of tSelectedChunk <= tCharCount then select after control id sTextID
end selectionChanged

on rawKeyDown pKeyCode   
    -- if delete or backspace while obscured text then delete the entire contents
    if the obscureText of me then
        if pKeyCode = 65288 or pKeyCode = 65535 then
            set the text of control id sTextID to empty
            set the textContent  of me to empty
            showHidePlaceholder
        end if
    end if
    pass rawKeyDown
end rawKeyDown

on textChanged
    showHIdePlaceholder
    if the obscureText of me is false then
        set the textContent of me to the text of control id sTextID
    else
        wait the bulletDelay  of me milliseconds with messages
        showHideText
    end if
    pass textChanged
end textChanged

on exitField
    dispatch "fieldAction" to the owner of me with the textContent of me, the long id of the owner of me
    updateVisualControls
end exitField

on closeField
    exitField
 end closeField
 
on resizeControl
    resizeFields
end resizeControl

on pasteKey
    select the text of control id sTextID
    paste
    showHidePlaceholder
end pasteKey
///////////////  /EVENTS /////////////// 


/////////////// HELPERS ///////////////
function fieldIsEmpty
    return (the text control id sTextID is empty)
end fieldIsEmpty

# CENTER VERTICALLY
 command centerTextVertically pFieldLongID -- based on code by @BerndN
    local tTextHeight, tFieldY, tFormatRect, tFormatheight, tFormatHalfHeight, \
          tCurrFormatTop, tCenterField_To_TopTextDiff
    
    put the effective textHeight of pFieldLongID into tTextHeight
    put item 2 of the loc of pFieldLongID into tfieldY
    put the formattedRect of line 1 to - 1 of pFieldLongID into tFormatRect
    put item 4 of tFormatRect - item 2 of tFormatRect into tFormatHeight
    put tFormatHeight div 2 into tFormatHalfHeight
    put item 2 of tFormatRect into tCurrFormatTop
    put tfieldY - tCurrFormatTop into tCenterField_To_TopTextDiff
    set the topMargin of pFieldLongID to the topMargin of pFieldLongID + tCenterField_To_TopTextDiff - tFormatHalfHeight
    if the formattedHeight of pFieldLongID > the height of pFieldLongID then 
        set the topMargin of pFieldLongID to 8
    end if 
end centerTextVertically
