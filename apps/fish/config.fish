# Login
if command -v archey >/dev/null
   archey --offline
else
   uptime
end

source ~/.config/fish/aliases.fish

# colour shell
set fish_color_normal normal # the default color
set fish_color_command green # the color for commands
set fish_color_quote yellow # the color for quoted blocks of text
set fish_color_redirection normal # the color for IO redirections (|><)
set fish_color_end normal # the color for process separators like ';' and '&'
set fish_color_error red --bold # the color used to highlight potential errors
set fish_color_param normal # the color for regular command parameters
set fish_color_comment 555 # the color used for code comments
# set fish_color_match purple --background=303030 # the color used to highlight matching parenthesis
set fish_color_search_match --background=0A0682 # the color used to highlight history search matches
set fish_color_operator normal # the color for parameter expansion operators like '*' and '~'
set fish_color_escape cyan # the color used to highlight character escapes like '\n' and '\x70'
set fish_color_cwd blue # the color used for the current working directory in the default prompt
set fish_color_cwd_root red
set fish_color_autosuggestion 555 # the color used for autosuggestions
# set fish_color_user # the color used to print the current username in some of fish default prompts
# set fish_color_host # the color used to print the current host system in some of fish default prompts
set fish_color_valid_path --underline
set fish_pager_color_prefix red # the color of the prefix string, i.e. the string that is to be completed
set fish_pager_color_completion normal # the color of the completion itself
set fish_pager_color_description 777 yellow # the color of the completion description
set fish_pager_color_progress cyan  # the color of the progress bar at the bottom left corner
set fish_pager_color_secondary cyan # the background color of the every second completion

# colour Man Pages
set -gx LESS_TERMCAP_mb \e'[01;31m' # begin blinking
set -gx LESS_TERMCAP_md \e'[01;31m' # begin bold
set -gx LESS_TERMCAP_me \e'[0m' # end mode
set -gx LESS_TERMCAP_se \e'[0m' # end standout-mode
set -gx LESS_TERMCAP_so \e'[01;44;33m' # begin standout-mode - info box
set -gx LESS_TERMCAP_ue \e'[0m' # end underline
set -gx LESS_TERMCAP_us \e'[01;32m' # begin underline
