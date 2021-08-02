# Colors
RED='\033[0;31m'
YELLOW='\033[0;33m'
PINK='\033[0;35m'
RED_BG='\033[0;41m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'
B=$(tput bold)

# Loggers
info() { echo -e "[${BLUE}${B}*${NC}] ${@}${NC}"; }
warn() { echo -e "[${YELLOW}${B}!${NC}] ${YELLOW}${@}${NC}"; }
error() { echo -e "[${RED}-${NC}] ${RED}${@}${NC}"; }
panic() { echo -e "[${RED_BG}PANIC${NC}] ${RED_BG}${@}${NC}"; }
success() { echo -e "[${GREEN}+${NC}] ${GREEN}${@}${NC}"; }
ins() { echo -e "[${BLUE}${B}INS${NC}] ${@}${NC}"; }
mov() { echo -e "[${RED}${B}MOV${NC}] ${@}${NC}"; }
new() { echo -e "[${GREEN}${B}NEW${NC}] ${@}${NC}"; }
# -------------------------------------------------------------------
spinner() {
    pid=$! # Process Id of the previous running command    
    spin=('-' '\' '|' '/')
    #spin=('o--' '-o-' '--o' '-o-')
    #spin=("${RED}o${YELLOW}---" "-${RED}o${YELLOW}--" "--${RED}o${YELLOW}-" "---${RED}o${YELLOW}" "--${RED}o${YELLOW}-" "-${RED}o${YELLOW}--") # Only works if spin substitution is substituted without %s in the printf
    #spin=('o---' '-o--' '--o-' '---o' '--o-' '-o--')
    #spin=('----' 'o---' '-o--' '--o-' '---o' '----' '---o' '--o-' '-o--' 'o---')
    #spin=('----' 'o---' 'Oo--' 'oOo-' '-oOo' '--oO' '---o' '----' '---o' '--oO' '-oOo' 'oOo-' 'Oo--' 'o---')
    i=0
    while kill -0 $pid 2>/dev/null; do
      printf "\r[${YELLOW}%s${NC}] %s" "${spin[$i]}" "$1"
      sleep .1
      i=$(( (i+1) % ${#spin[@]} ))
    done
    printf "\r[${GREEN}Done${NC}] %s\n" "$1"
}
# -------------------------------------------------------------------
