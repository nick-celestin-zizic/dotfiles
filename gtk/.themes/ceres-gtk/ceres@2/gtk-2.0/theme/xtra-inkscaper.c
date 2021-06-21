style "inkscape"{
engine"mist"{}}
widget_class "*SPDesktopWidget" style "inkscape"
widget_class "*SPCanvas*" style "inkscape"

style"inkscape2"{
xthickness=8
ythickness=8}
widget_class "*SPDesktopWidget*GtkRadioButton*" style "inkscape2"
widget "*gdl-button*" style "inkscape2"

style"inkscapespinbutton"{
xthickness=10
ythickness=12}
widget_class "*SPDesktopWidget*gtkmm__GtkSpinButton*" style "inkscapespinbutton"

style"inkscapecombo"{
xthickness=10
ythickness=12}
widget_class "*SPDesktopWidget*GtkComboBox*" style "inkscapecombo"

style"inkscapedockitemgrip"{
xthickness=20
ythickness=8
engine"pixmap"{
image{
function=SHADOW
file="images/none.svg"
stretch=TRUE}}}
widget_class "*SPDesktopWidget*GdlDockItemGrip*" style "inkscapedockitemgrip"

widget"*InkscapePanel*GtkVScrollbar"style"scrollbar"
widget"*InkscapePanel*GtkHScrollbar"style"scrollbar"

style"inkscapedock"{
xthickness=4
ythickness=4
engine"pixmap"{
image{
function=SHADOW
file="images/none.svg"
stretch=TRUE}}}
widget_class "*SPDesktopWidget*gtkmm__GtkScrolledWindow.GtkViewport" style "inkscapedock"
widget_class "*SPDesktopWidget*GtkToolbar" style "inkscapedock"
