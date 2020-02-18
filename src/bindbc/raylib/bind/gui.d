module bindbc.raylib.bind.gui;

import bindbc.raylib.types;

version (BindRaylib_Static) {
   extern (C) @nogc nothrow {
      // TODO:
   }
} else {
   extern (C) @nogc nothrow {
      // Global gui modification functions
      /**
       * Enable gui controls (global state)
       */
      alias pGuiEnable = void function();
      /**
       * Disable gui controls (global state)
       */
      alias pGuiDisable = void function();
      /**
       * Lock gui controls (global state)
       */
      alias pGuiLock = void function();
      /**
       * Unlock gui controls (global state)
       */
      alias pGuiUnlock = void function();
      /**
       * Set gui controls alpha (global state), alpha goes from 0.0f to 1.0f
       */
      alias pGuiFade = void function(float alpha);

      /**
       * Set gui state (global state)
       */
      alias pGuiSetState = void function(int state);
      /**
       * Get gui state (global state)
       */
      alias pGuiGetState = int function();

      /**
       * Set gui custom font (global state)
       */
      alias pGuiSetFont = void function(Font font);
      /**
       * Get gui custom font (global state)
       */
      alias pGuiGetFont = Font function();

      // Style set/get functions
      /**
       * Set one style property
       */
      alias pGuiSetStyle = void function(int control, int property, int value);
      /**
       * Get one style property
       */
      alias pGuiGetStyle = int function(int control, int property);

      // Container/separator controls, useful for controls organization
      /**
       * Window Box control, shows a window that can be closed
       */
      alias pGuiWindowBox = bool function(Rectangle bounds, const(char)* title);
      /**
       * Group Box control with text name
       */
      alias pGuiGroupBox = void function(Rectangle bounds, const(char)* text);
      /**
       * Line separator control, could contain text
       */
      alias pGuiLine = void function(Rectangle bounds, const(char)* text);
      /**
       * Panel control, useful to group controls
       */
      alias pGuiPanel = void function(Rectangle bounds);
      /**
       * Scroll Panel control
       */
      alias pGuiScrollPanel = Rectangle function(Rectangle bounds, Rectangle content, Vector2* scroll);

      // Basic controls set
      /**
       * Label control, shows text
       */
      alias pGuiLabel = void function(Rectangle bounds, const(char)* text);
      /**
       * Button control, returns true when clicked
       */
      alias pGuiButton = bool function(Rectangle bounds, const(char)* text);
      /**
       * Label button control, show true when clicked
       */
      alias pGuiLabelButton = bool function(Rectangle bounds, const(char)* text);
      /**
       * Image button control, returns true when clicked
       */
      alias pGuiImageButton = bool function(Rectangle bounds, const(char)* text, Texture2D texture);
      /**
       * Image button extended control, returns true when clicked
       */
      alias pGuiImageButtonEx = bool function(Rectangle bounds, const(char)* text, Texture2D texture, Rectangle texSource);
      /**
       * Toggle Button control, returns true when active
       */
      alias pGuiToggle = bool function(Rectangle bounds, const(char)* text, bool active);
      /**
       * Toggle Group control, returns active toggle index
       */
      alias pGuiToggleGroup = int function(Rectangle bounds, const(char)* text, int active);
      /**
       * Check Box control, returns true when active
       */
      alias pGuiCheckBox = bool function(Rectangle bounds, const(char)* text, bool checked);
      /**
       * Combo Box control, returns selected item index
       */
      alias pGuiComboBox = int function(Rectangle bounds, const(char)* text, int active);
      /**
       * Dropdown Box control, returns selected item
       */
      alias pGuiDropdownBox = bool function(Rectangle bounds, const(char)* text, int* active, bool editMode);
      /**
       * Spinner control, returns selected value
       */
      alias pGuiSpinner = bool function(Rectangle bounds, const(char)* text, int* value, int minValue, int maxValue, bool editMode);
      /**
       * Value Box control, updates input text with numbers
       */
      alias pGuiValueBox = bool function(Rectangle bounds, const(char)* text, int* value, int minValue, int maxValue, bool editMode);
      /**
       * Text Box control, updates input text
       */
      alias pGuiTextBox = bool function(Rectangle bounds, char* text, int textSize, bool editMode);
      /**
       * Text Box control with multiple lines
       */
      alias pGuiTextBoxMulti = bool function(Rectangle bounds, char* text, int textSize, bool editMode);
      /**
       * Slider control, returns selected value
       */
      alias pGuiSlider = float function(Rectangle bounds, const(char)* textLeft, const(char)* textRight, float value,
            float minValue, float maxValue);
      /**
       * Slider Bar control, returns selected value
       */
      alias pGuiSliderBar = float function(Rectangle bounds, const(char)* textLeft, const(char)* textRight, float value,
            float minValue, float maxValue);
      /**
       * Progress Bar control, shows current progress value
       */
      alias pGuiProgressBar = float function(Rectangle bounds, const(char)* textLeft, const(char)* textRight,
            float value, float minValue, float maxValue);
      /**
       * Status Bar control, shows info text
       */
      alias pGuiStatusBar = void function(Rectangle bounds, const(char)* text);
      /**
       * Dummy control for placeholders
       */
      alias pGuiDummyRec = void function(Rectangle bounds, const(char)* text);
      /**
       * Scroll Bar control
       */
      alias pGuiScrollBar = int function(Rectangle bounds, int value, int minValue, int maxValue);
      /**
       * Grid control
       */
      alias pGuiGrid = Vector2 function(Rectangle bounds, float spacing, int subdivs);

      // Advance controls set
      /**
       * List View control, returns selected list item index
       */
      alias pGuiListView = int function(Rectangle bounds, const(char)* text, int* scrollIndex, int active);
      /**
       * List View with extended parameters
       */
      alias pGuiListViewEx = int function(Rectangle bounds, const(char)** text, int count, int* focus, int* scrollIndex, int active);
      /**
       * Message Box control, displays a message
       */
      alias pGuiMessageBox = int function(Rectangle bounds, const(char)* title, const(char)* message, const(char)* buttons);
      /**
       * Text Input Box control, ask for text
       */
      alias pGuiTextInputBox = int function(Rectangle bounds, const(char)* title, const(char)* message, const(char)* buttons, char* text);
      /**
       * Color Picker control
       */
      alias pGuiColorPicker = Color function(Rectangle bounds, Color color);

      // Styles loading functions
      /**
       * Load style file (.rgs)
       */
      alias pGuiLoadStyle = void function(const(char)* fileName);
      /**
       * Load style default over global style
       */
      alias pGuiLoadStyleDefault = void function();
   }
   __gshared {
      pGuiEnable GuiEnable;
      pGuiDisable GuiDisable;
      pGuiLock GuiLock;
      pGuiUnlock GuiUnlock;
      pGuiFade GuiFade;
      pGuiSetState GuiSetState;
      pGuiGetState GuiGetState;
      pGuiSetFont GuiSetFont;
      pGuiGetFont GuiGetFont;
      pGuiSetStyle GuiSetStyle;
      pGuiGetStyle GuiGetStyle;
      pGuiWindowBox GuiWindowBox;
      pGuiGroupBox GuiGroupBox;
      pGuiLine GuiLine;
      pGuiPanel GuiPanel;
      pGuiScrollPanel GuiScrollPanel;
      pGuiLabel GuiLabel;
      pGuiButton GuiButton;
      pGuiLabelButton GuiLabelButton;
      pGuiImageButton GuiImageButton;
      pGuiImageButtonEx GuiImageButtonEx;
      pGuiToggle GuiToggle;
      pGuiToggleGroup GuiToggleGroup;
      pGuiCheckBox GuiCheckBox;
      pGuiComboBox GuiComboBox;
      pGuiDropdownBox GuiDropdownBox;
      pGuiSpinner GuiSpinner;
      pGuiValueBox GuiValueBox;
      pGuiTextBox GuiTextBox;
      pGuiTextBoxMulti GuiTextBoxMulti;
      pGuiSlider GuiSlider;
      pGuiSliderBar GuiSliderBar;
      pGuiProgressBar GuiProgressBar;
      pGuiStatusBar GuiStatusBar;
      pGuiDummyRec GuiDummyRec;
      pGuiScrollBar GuiScrollBar;
      pGuiGrid GuiGrid;
      pGuiListView GuiListView;
      pGuiListViewEx GuiListViewEx;
      pGuiMessageBox GuiMessageBox;
      pGuiTextInputBox GuiTextInputBox;
      pGuiColorPicker GuiColorPicker;
      pGuiLoadStyle GuiLoadStyle;
      pGuiLoadStyleDefault GuiLoadStyleDefault;
   }
}
