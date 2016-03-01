// main.d
import dlangui.all;
mixin DLANGUI_ENTRY_POINT;

/// entry point for dlangui based application
extern (C) int UIAppMain(string[] args) {
    // resource directory search paths
    string[] resourceDirs = [
        appendPath(exePath, "../res/"),   // for Visual D and DUB builds
        appendPath(exePath, "../../res/") // for Mono-D builds
    ];

    // setup resource directories - will use only existing directories
    Platform.instance.resourceDirs = resourceDirs;
    // select translation file - for english language
    Platform.instance.uiLanguage = "en";
    // load theme from file "theme_default.xml"
    Platform.instance.uiTheme = "theme_default";

    // create window
    Window window = Platform.instance.createWindow("My Window", null);
    // create some widget to show in window
    window.mainWidget = (new Button()).text("Hello world"d).textColor(0xFF0000); // red text
    // show window
    window.show();
    // run message loop
    return Platform.instance.enterMessageLoop();
}