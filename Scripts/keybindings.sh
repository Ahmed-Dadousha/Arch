data=$(
	cat <<-EOF
		      Keybinding                                   Difinition
		      # System Keybindings [Super = Enter]
		      super + w                                    Open Browser.
		      super + f                                    File Manager.
		      super + b                                    Open Burpsuite.
		      super + p                                    Take a Screenshot With Selection.
		      super + equal or minus or backspace          Volume.
		      super + shift + e                            Exit Machine.
		      super + F1 or F2                             Brightness.

		      # DWM Keybindings [Super = Enter]
		      super + d                                    Run Dmenu.
		      super + j                                    Change Focus.
		      super + k                                    Change Focus.
		      super + Enter                                Open a Terminal.
		      super + tab                                  Switch Workspaces.
		      super + shift + c                            kill a Window.
		      super + shift + b                            Toggle Top Bar.
		      super + shift + q                            Kill DWM.
		      super + shift + j                            Move a Window Down In Stack.
		      super + shift + k                            Move a Window Up In Stack.
		      super + shift + l                            Increase Left Window Size In Stack.
		      super + shift + h                            Increase Right Window Size In Stack.
		      super + shift + Enter                        Move a Terminal To Stack.

		      # Tmux [Prefix = Ctrl + b]
		      Prefix + |                                  Split Horizontal.
		      Perfix + -                                  Split Vertical.
		      Perfix + r                                  Reload Configurations.
		      Perfix + m                                  Minimize or Maximize.
		      Perfix + I                                  Install Plugins.
		      Ctrl + h                                    Change Focus To Left.
		      Ctrl + l                                    Change Focus To Right.
		      Ctrl + j                                    Change Focus To Down.
		      Ctrl + k                                    Change Focus To Up.

		      # Terminal [Kitty]
		      super + shift + equal                       Increase Font Size.
		      super + shift + minus                       Decrease Font Size.

	EOF
)

echo "$data" | sed 's/^[[:space:]]*//' | dmenu
