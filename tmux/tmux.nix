{ config, pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    shell = "${pkgs.zsh}/bin/zsh";
    extraConfig = ''
      # Use Vi mode
      setw -g mode-keys vi

      # Increase scrollback buffer size
      set -g history-limit 10000

      # Start window and pane numbering from 1 for easier switching
      set -g base-index 1
      setw -g pane-base-index 1

      # Allow automatic renaming of windows
      set -g allow-rename on

      # Renumber windows when one is removed.
      set -g renumber-windows on

      # Improve colors
      set -g default-terminal "''${TERM}"

      # Enable undercurl
      set -as terminal-overrides ',*:Smulx=\E[4::%p1%dm'

      # Enable undercurl colors
      set -as terminal-overrides ',*:Setulc=\E[58::2::%p1%{65536}%/%d::%p1%{256}%/%{255}%&%d::%p1%{255}%&%d%;m'

      # Allow the mouse to resize windows and select tabs
      set -g mouse on

      # Allow tmux to set the terminal title
      set -g set-titles on

      # Monitor window activity to display in the status bar
      setw -g monitor-activity on

      # A bell in another window should cause a bell in the current window
      set -g bell-action any

      # Don't show distracting notifications
      set -g visual-bell off
      set -g visual-activity off

      # Focus events enabled for terminals that support them
      set -g focus-events on

      # Useful when using sharing a session with different size terminals
      setw -g aggressive-resize on

      # don't detach tmux when killing a session
      set -g detach-on-destroy off

      # address vim mode switching delay (http://superuser.com/a/252717/65504)
      set -s escape-time 0

      # Status line customisation
      set-option -g status-left-length 100
      set-option -g status-right-length 100

      set-option -g status-left " #{session_name}  "
      set-option -g status-right "#{pane_title} "

      set-option -g status-style "fg=#545c7e bg=#1f2335"

      set-option -g window-status-format "#{window_index}:#{pane_current_command}#{window_flags} "
      set-option -g window-status-current-format "#{window_index}:#{pane_current_command}#{window_flags} "

      set-option -g window-status-current-style "fg=#E9E9EA"
      set-option -g window-status-activity-style none

      set-option -g pane-active-border-style "fg=#1f2335"
      set-option -g pane-border-style "fg=#1f2335"

      # Key Bindings
      unbind r
      bind r source-file $HOME/.tmux.conf\; display-message '~/.tmux.conf reloaded'

      bind C-p previous-window
      bind C-n next-window

      bind -r h select-pane -L
      bind -r j select-pane -D
      bind -r k select-pane -U
      bind -r l select-pane -R
      bind -r C-h select-window -t :-
      bind -r C-l select-window -t :+

      is_vim='echo "#{pane_current_command}" | grep -iqE "(^|\/)g?(view|n?vim?)(diff)?$"'
      bind -n C-h if-shell "$is_vim" "send-keys C-h" "select-pane -L"
      bind -n C-j if-shell "$is_vim" "send-keys C-j" "select-pane -D"
      bind -n C-k if-shell "$is_vim" "send-keys C-k" "select-pane -U"
      bind -n C-l if-shell "$is_vim" "send-keys C-l" "select-pane -R"

      bind -r n next-window
      bind -r p previous-window

      bind -r N run-shell "tmux swap-window -t $(expr $(tmux list-windows | grep \"(active)\" | cut -d \":\" -f 1) + 1)"
      bind -r P run-shell "tmux swap-window -t $(expr $(tmux list-windows | grep \"(active)\" | cut -d \":\" -f 1) - 1)"

      bind-key > swap-window -t +1 \; next
      bind-key < swap-window -t -1 \; prev

      bind Space last-window

      bind ^ switch-client -l

      bind | split-window -h -c "#{pane_current_path}"
      bind - split-window -v -c "#{pane_current_path}"

      bind c new-window -c "#{pane_current_path}"

      if-shell -b '[ "$(echo "$TMUX_VERSION >= 2.4" | bc)" = 1 ]' \
          'bind-key -T copy-mode-vi v send-keys -X begin-selection;'

      bind y run -b "tmux show-buffer | xclip -selection clipboard"\; display-message "Copied tmux buffer to system clipboard"

      bind-key -r F new-window t
      bind-key -r D run-shell "t ~/dotfiles"
    '';
    plugins = with pkgs.tmuxPlugins; [
      # Add any tmux plugins you want to use here
    ];
  };
}
