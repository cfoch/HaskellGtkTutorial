import Graphics.UI.Gtk

button_on_off_cb button = do
    label <- buttonGetLabel button
    if label == "on" then 
        buttonSetLabel button "off"
    else
        buttonSetLabel button "on"

main = do
    initGUI
    window <- windowNew
    button <- buttonNewWithLabel "on"
    set window [containerChild := button]
    windowSetDefaultSize window 600 300
    widgetShowAll window
    window `on` objectDestroy $ mainQuit
    button `on` buttonActivated $ button_on_off_cb button
    mainGUI
