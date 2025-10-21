#!/bin/bash

# =============================================
# HACKER TERMINAL SCRIPT
# CREATED BY : KHOKON TALUKDAR
# VERSION    : 3.0
# DESCRIPTION: Ultra Advanced Hacker Terminal Interface
# =============================================

# Color codes with more variations
BLACK='\033[0;30m'
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[0;37m'
BOLD_BLACK='\033[1;30m'
BOLD_RED='\033[1;31m'
BOLD_GREEN='\033[1;32m'
BOLD_YELLOW='\033[1;33m'
BOLD_BLUE='\033[1;34m'
BOLD_PURPLE='\033[1;35m'
BOLD_CYAN='\033[1;36m'
BOLD_WHITE='\033[1;37m'
ORANGE='\033[0;38;5;214m'
BOLD_ORANGE='\033[1;38;5;214m'
NEON_GREEN='\033[1;38;5;118m'
NEON_BLUE='\033[1;38;5;45m'
NEON_PURPLE='\033[1;38;5;93m'
NC='\033[0m' # No Color

# Global variables
SCRIPT_DIR="$HOME/hacker_tools"
LOG_FILE="$SCRIPT_DIR/hacker.log"
CONFIG_FILE="$SCRIPT_DIR/config.cfg"

# Initialize script
init_script() {
    clear
    # Create necessary directories
    mkdir -p "$SCRIPT_DIR"
    touch "$LOG_FILE"
    
    # Log script start
    log_action "Script started by user: $(whoami)"
}

# Logging function
log_action() {
    local message="$1"
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $message" >> "$LOG_FILE"
}

# Advanced loading animations
loading_spinner() {
    local pid=$!
    local spin='⣾⣽⣻⢿⡿⣟⣯⣷'
    local char_width=3
    local i=0
    
    while kill -0 $pid 2>/dev/null; do
        i=$(( (i + 1) % 8 ))
        printf "\r${BOLD_CYAN}%s${NC} ${NEON_GREEN}Processing...${NC} " "${spin:$i:$char_width}"
        sleep 0.1
    done
    printf "\r${BOLD_GREEN}✓ Done!${NC}                            \n"
}

loading_bar() {
    local duration=$1
    local bar=""
    local progress=0
    
    echo -e "${NEON_BLUE}"
    for ((i=0; i<=100; i++)); do
        progress=$i
        bar="["
        for ((j=0; j<50; j++)); do
            if [ $j -lt $((progress/2)) ]; then
                bar+="█"
            else
                bar+="░"
            fi
        done
        bar+="] $progress%"
        echo -ne "\r$bar"
        sleep $(echo "scale=5; $duration/100" | bc -l)
    done
    echo -e "${NC}"
}

pulse_animation() {
    local text=$1
    local colors=("${BOLD_RED}" "${BOLD_ORANGE}" "${BOLD_YELLOW}" "${BOLD_GREEN}" "${BOLD_CYAN}" "${BOLD_BLUE}" "${BOLD_PURPLE}")
    for color in "${colors[@]}"; do
        echo -ne "\r${color}${text}${NC}"
        sleep 0.2
    done
}

# Ultra stylish header with multiple designs
show_header() {
    clear
    local header_design=$((RANDOM % 3))
    
    case $header_design in
        0)
            echo -e "${BOLD_CYAN}"
            echo "╔════════════════════════════════════════════════════════════════╗"
            echo "║                                                                ║"
            echo "║  ██   ██ █████ █████ █████ ██████  ██████  █████ ██████████   ║"
            echo "║  ██   ██ ██      ██  ██      ██    ██   ██ ██       ██        ║"
            echo "║  ███████ █████   ██  █████   ██    ██████  █████    ██        ║"
            echo "║  ██   ██ ██      ██  ██      ██    ██   ██ ██       ██        ║"
            echo "║  ██   ██ █████   ██  █████   ██    ██   ██ █████    ██        ║"
            echo "║                                                                ║"
            echo "║    ████████ █████ ██      ██████ ██████ ██  ██████ ██████     ║"
            echo "║       ██   ██   █ ██      ██     ██   █ ██ ██      ██   █     ║"
            echo "║       ██   █████ ██      █████  ██████ ██ ██      ██████      ║"
            echo "║       ██   ██   ██       ██     ██  █  ██ ██      ██  █       ║"
            echo "║       ██   ██   ████████ ██████ ██   █ ██  ██████ ██   ██     ║"
            echo "║                                                                ║"
            echo "╚════════════════════════════════════════════════════════════════╝"
            ;;
        1)
            echo -e "${NEON_GREEN}"
            echo "┌────────────────────────────────────────────────────────────────┐"
            echo "│    ╦ ╦┌─┐┌─┐┬┌─┬ ┬┌┬┐┌─┐┌┐┌┌─┐┌─┐    ╔═╗┌─┐┌─┐┬┌─┌─┐┬ ┬┌┬┐    │"
            echo "│    ╠═╣├─┤│ ┬├┴┐│ ││││├─┤│││├┤ ├┤     ╠═╝├─┤│ ┬├┴┐├─┤│ ││││    │"
            echo "│    ╩ ╩┴ ┴└─┘┴ ┴└─┘┴ ┴┴ ┴┘└┘└─┘└─┘    ╩  ┴ ┴└─┘┴ ┴┴ ┴└─┘┴ ┴    │"
            echo "│    ╔═╗╔═╗╔═╗╦═╗╔╦╗╔═╗╔╦╗╔═╗╔═╗        ╦  ╦╔═╗╔╦╗╔═╗╔╗╔╔╦╗    │"
            echo "│    ╠═╣║ ╦║ ║╠╦╝ ║ ╠═╣ ║ ║╣ ║╣         ║  ║╠═╣ ║ ║╣ ║║║ ║     │"
            echo "│    ╩ ╩╚═╝╚═╝╩╚═ ╩ ╩ ╩ ╩ ╚═╝╚═╝        ╩═╝╩╩ ╩ ╩ ╚═╝╝╚╝ ╩     │"
            echo "└────────────────────────────────────────────────────────────────┘"
            ;;
        2)
            echo -e "${BOLD_PURPLE}"
            echo " ██████╗ ██████╗ ██████╗ ███████╗    ████████╗███████╗██████╗ ███╗   ███╗██╗███╗   ██╗ █████╗ ██╗     "
            echo "██╔════╝██╔═══██╗██╔══██╗██╔════╝    ╚══██╔══╝██╔════╝██╔══██╗████╗ ████║██║████╗  ██║██╔══██╗██║     "
            echo "██║     ██║   ██║██║  ██║█████╗         ██║   █████╗  ██████╔╝██╔████╔██║██║██╔██╗ ██║███████║██║     "
            echo "██║     ██║   ██║██║  ██║██╔══╝         ██║   █████║  ██╔══██╗██║╚██╔╝██║██║██║╚██╗██║██╔══██║██║     "
            echo "╚██████╗╚██████╔╝██████╔╝███████╗       ██║   ███████╗██║  ██║██║ ╚═╝ ██║██║██║ ╚████║██║  ██║███████╗"
            echo " ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝       ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝╚══════╝"
            echo -e "${NC}"
            ;;
    esac
    
    echo -e "${BOLD_CYAN}"
    echo "┌────────────────────────────────────────────────────────────────┐"
    echo "│               ULTRA ADVANCED SECURITY FRAMEWORK v3.0           │"
    echo "│                   CREATED BY: KHOKON TALUKDAR                  │"
    echo "└────────────────────────────────────────────────────────────────┘"
    echo -e "${NC}"
    
    # Animated border
    for i in {1..3}; do
        echo -ne "${NEON_GREEN}█${NC}"
        sleep 0.1
        echo -ne "${NEON_BLUE}█${NC}"
        sleep 0.1
        echo -ne "${NEON_PURPLE}█${NC}"
        sleep 0.1
    done
    echo ""
    sleep 1
}

# Enhanced matrix animation with colors
matrix_animation() {
    echo -e "${BOLD_GREEN}"
    echo -e "${NEON_GREEN}INITIALIZING QUANTUM SECURE CONNECTION...${NC}"
    sleep 1
    
    local matrix_chars=("0" "1" " " "█" "▓" "▒" "░" "§" "¶" "⎈" "⚡" "🔒" "💻" "🔑")
    local colors=("${GREEN}" "${NEON_GREEN}" "${BOLD_GREEN}" "${CYAN}" "${BOLD_CYAN}" "${NEON_BLUE}")
    
    for i in {1..15}; do
        local line=""
        local color=${colors[$RANDOM % ${#colors[@]}]}
        for j in {1..60}; do
            local char=${matrix_chars[$RANDOM % ${#matrix_chars[@]}]}
            line+="$char"
        done
        echo -e "${color}$line${NC}"
        sleep 0.08
    done
    
    # Final flash effect
    for i in {1..3}; do
        echo -e "${BOLD_WHITE}▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓${NC}"
        sleep 0.1
        echo -e "${NEON_GREEN}░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░${NC}"
        sleep 0.1
    done
    echo -e "${NC}"
}

# System information with stylish design
show_system_info() {
    echo -e "${BOLD_YELLOW}"
    echo "╔════════════════════════════ SYSTEM INFORMATION ═══════════════════════════╗"
    echo -e "${BOLD_WHITE}║${NC}"
    
    # Animated system info display
    local info_parts=(
        "  User        : $(whoami)"
        "  Hostname    : $(hostname)"
        "  OS          : $(uname -o)"
        "  Kernel      : $(uname -r)"
        "  Architecture: $(uname -m)"
        "  Uptime      : $(uptime -p | sed 's/up //')"
        "  Shell       : $(echo $SHELL)"
        "  Terminal    : $TERM"
    )
    
    for part in "${info_parts[@]}"; do
        echo -e "${BOLD_WHITE}║${NC} ${part}"
        sleep 0.2
    done
    
    echo -e "${BOLD_WHITE}║${NC}"
    echo -e "${BOLD_YELLOW}╚══════════════════════════════════════════════════════════════════════════╝${NC}"
    sleep 1
}

# Network information with enhanced design
show_network_info() {
    echo -e "${BOLD_BLUE}"
    echo "╔════════════════════════════ NETWORK INFORMATION ═════════════════════════╗"
    echo -e "${BOLD_WHITE}║${NC}"
    
    # Get IP address with animation
    echo -ne "${BOLD_WHITE}║  Scanning network interface "
    for i in {1..3}; do
        echo -n "."
        sleep 0.3
    done
    echo -e " ${BOLD_GREEN}✓${NC}"
    
    local ip=$(ip route get 1 2>/dev/null | awk '{print $7}' | head -1)
    if [ -z "$ip" ]; then
        ip="${BOLD_RED}Not Connected${NC}"
    fi
    
    echo -e "${BOLD_WHITE}║  IP Address  : $ip${NC}"
    
    # Public IP with loading
    echo -ne "${BOLD_WHITE}║  Fetching public IP "
    (curl -s ifconfig.me > /tmp/public_ip.txt) &
    loading_spinner
    local public_ip=$(cat /tmp/public_ip.txt)
    if [ -z "$public_ip" ]; then
        public_ip="${BOLD_RED}Unknown${NC}"
    fi
    echo -e "${BOLD_WHITE}║  Public IP   : $public_ip${NC}"
    
    # DNS information
    local dns=$(cat /etc/resolv.conf 2>/dev/null | grep nameserver | head -1 | awk '{print $2}')
    echo -e "${BOLD_WHITE}║  DNS         : ${dns:-${BOLD_RED}Not Configured${NC}}${NC}"
    
    # Internet connectivity with animation
    echo -ne "${BOLD_WHITE}║  Network status "
    (ping -c 1 google.com &> /dev/null) &
    local pid=$!
    local spin='⣾⣽⣻⢿⡿⣟⣯⣷'
    local i=0
    while kill -0 $pid 2>/dev/null; do
        i=$(( (i + 1) % 8 ))
        printf "\r${BOLD_WHITE}║  Network status ${NEON_GREEN}%s${NC} " "${spin:$i:1}"
        sleep 0.1
    done
    
    if wait $pid; then
        printf "\r${BOLD_WHITE}║  Status      : ${BOLD_GREEN}ONLINE${NC}                            \n"
    else
        printf "\r${BOLD_WHITE}║  Status      : ${BOLD_RED}OFFLINE${NC}                           \n"
    fi
    
    echo -e "${BOLD_WHITE}║${NC}"
    echo -e "${BOLD_BLUE}╚══════════════════════════════════════════════════════════════════════════╝${NC}"
    sleep 1
}

# Enhanced security check with animations
run_security_check() {
    echo -e "${BOLD_RED}"
    echo "╔══════════════════════════════ SECURITY SCAN ═════════════════════════════╗"
    echo -e "${BOLD_WHITE}║${NC}"
    
    security_checks=(
        "System integrity verification"
        "Vulnerability assessment"
        "Encryption protocols"
        "Firewall status"
        "Intrusion detection"
        "Malware scan"
    )
    
    for check in "${security_checks[@]}"; do
        echo -ne "${BOLD_WHITE}║  ${check} "
        local dots=25
        printf "%-${dots}s" 
        for i in {1..3}; do
            echo -n "."
            sleep 0.2
        done
        
        # Simulate check result
        if [ $((RANDOM % 3)) -eq 0 ]; then
            echo -e " ${BOLD_RED}✗${NC}"
        else
            echo -e " ${BOLD_GREEN}✓${NC}"
        fi
        sleep 0.3
    done
    
    echo -e "${BOLD_WHITE}║${NC}"
    echo -e "${BOLD_RED}╚══════════════════════════════════════════════════════════════════════════╝${NC}"
    sleep 1
}

# Enhanced tools menu with better visual design
show_tools_menu() {
    while true; do
        clear
        echo -e "${BOLD_PURPLE}"
        echo "╔══════════════════════════════ HACKER TOOLS ════════════════════════════╗"
        echo -e "${BOLD_WHITE}║${NC}"
        echo -e "${BOLD_WHITE}║${NEON_GREEN}  1.  Network Scanner        ${NEON_BLUE} 7.  Process Monitor        ${NC}"
        echo -e "${BOLD_WHITE}║${NEON_GREEN}  2.  Port Scanner           ${NEON_BLUE} 8.  Disk Space Analyzer    ${NC}"
        echo -e "${BOLD_WHITE}║${NEON_GREEN}  3.  System Information     ${NEON_BLUE} 9.  Network Speed Test     ${NC}"
        echo -e "${BOLD_WHITE}║${NEON_GREEN}  4.  File Encryptor         ${NEON_BLUE} 10. System Update          ${NC}"
        echo -e "${BOLD_WHITE}║${NEON_GREEN}  5.  Password Generator     ${NEON_BLUE} 11. Clear Logs             ${NC}"
        echo -e "${BOLD_WHITE}║${NEON_GREEN}  6.  DNS Lookup             ${NEON_BLUE} 12. View Activity Log      ${NC}"
        echo -e "${BOLD_WHITE}║${NEON_GREEN}  13. Network Statistics     ${NEON_BLUE} 14. Security Audit         ${NC}"
        echo -e "${BOLD_WHITE}║${NEON_GREEN}  15. Crypto Tools           ${NEON_BLUE} 16. Steganography          ${NC}"
        echo -e "${BOLD_WHITE}║${NC}"
        echo -e "${BOLD_WHITE}║${BOLD_RED}  0.  Exit${NC}"
        echo -e "${BOLD_WHITE}║${NC}"
        echo -e "${BOLD_PURPLE}╚══════════════════════════════════════════════════════════════════════════╝${NC}"
        
        echo -e "\n${BOLD_CYAN}"
        read -p "┌─[SELECT OPTION]─[~]
└──╼ ❯ " choice
        
        case $choice in
            1) network_scanner ;;
            2) port_scanner ;;
            3) show_system_info ;;
            4) file_encryptor ;;
            5) password_generator ;;
            6) dns_lookup ;;
            7) process_monitor ;;
            8) disk_analyzer ;;
            9) speed_test ;;
            10) system_update ;;
            11) clear_logs ;;
            12) view_logs ;;
            13) network_stats ;;
            14) security_audit ;;
            15) crypto_tools ;;
            16) steganography_tools ;;
            0) exit_script ;;
            *) 
                echo -e "${BOLD_RED}"
                echo "╔══════════════════════════════════════════════════════════════════════════╗"
                echo "║                    INVALID OPTION! PLEASE TRY AGAIN.                    ║"
                echo "╚══════════════════════════════════════════════════════════════════════════╝"
                echo -e "${NC}"
                sleep 2 
                ;;
        esac
    done
}

# Enhanced network scanner
network_scanner() {
    echo -e "${BOLD_CYAN}"
    echo "╔════════════════════════════ NETWORK SCANNER ════════════════════════════╗"
    echo -e "${NC}"
    
    if command -v nmap &> /dev/null; then
        read -p "Enter network range (e.g., 192.168.1.0/24): " network
        if [ -n "$network" ]; then
            echo -e "${NEON_GREEN}Scanning network: $network${NC}"
            loading_bar 3
            nmap -sn "$network"
            log_action "Network scan performed on: $network"
        else
            echo -e "${BOLD_RED}No network range provided!${NC}"
        fi
    else
        echo -e "${BOLD_RED}nmap is not installed! Install with: pkg install nmap${NC}"
    fi
    echo -e "${BOLD_CYAN}╚══════════════════════════════════════════════════════════════════════════╝${NC}"
    read -p "Press Enter to continue..."
}

# Enhanced port scanner with visual feedback
port_scanner() {
    echo -e "${BOLD_CYAN}"
    echo "╔══════════════════════════════ PORT SCANNER ═════════════════════════════╗"
    echo -e "${NC}"
    
    if command -v nmap &> /dev/null; then
        read -p "Enter target IP or hostname: " target
        if [ -n "$target" ]; then
            echo -e "${NEON_GREEN}Scanning target: $target${NC}"
            echo -e "${NEON_BLUE}Initializing port scan...${NC}"
            loading_bar 2
            nmap -sS "$target"
            log_action "Port scan performed on: $target"
        else
            echo -e "${BOLD_RED}No target provided!${NC}"
        fi
    else
        echo -e "${BOLD_RED}nmap is not installed!${NC}"
    fi
    echo -e "${BOLD_CYAN}╚══════════════════════════════════════════════════════════════════════════╝${NC}"
    read -p "Press Enter to continue..."
}

# Enhanced file encryptor with style
file_encryptor() {
    echo -e "${BOLD_CYAN}"
    echo "╔════════════════════════════ FILE ENCRYPTOR ═════════════════════════════╗"
    echo -e "${NC}"
    
    read -p "Enter file path to encrypt: " file_path
    if [ -f "$file_path" ]; then
        if command -v gpg &> /dev/null; then
            echo -e "${NEON_GREEN}Encrypting file: $file_path${NC}"
            loading_bar 2
            gpg -c "$file_path"
            echo -e "${BOLD_GREEN}File encrypted successfully!${NC}"
            log_action "File encrypted: $file_path"
        else
            echo -e "${BOLD_RED}gpg is not installed! Install with: pkg install gnupg${NC}"
        fi
    else
        echo -e "${BOLD_RED}File not found!${NC}"
    fi
    echo -e "${BOLD_CYAN}╚══════════════════════════════════════════════════════════════════════════╝${NC}"
    read -p "Press Enter to continue..."
}

# Enhanced password generator
password_generator() {
    echo -e "${BOLD_CYAN}"
    echo "╔══════════════════════════ PASSWORD GENERATOR ═══════════════════════════╗"
    echo -e "${NC}"
    
    read -p "Enter password length (default 16): " length
    length=${length:-16}
    
    echo -e "${NEON_GREEN}Generating secure password...${NC}"
    loading_bar 1
    
    # Generate multiple password types
    password_alnum=$(tr -dc 'A-Za-z0-9' < /dev/urandom | head -c "$length")
    password_special=$(tr -dc 'A-Za-z0-9!@#$%^&*()_+-=[]{}|;:,.<>?' < /dev/urandom | head -c "$length")
    password_hex=$(openssl rand -hex "$((length/2))")
    
    echo -e "${BOLD_GREEN}Alphanumeric Password : $password_alnum${NC}"
    echo -e "${BOLD_BLUE}Special Char Password : $password_special${NC}"
    echo -e "${BOLD_PURPLE}Hexadecimal Key       : $password_hex${NC}"
    
    log_action "Password generated (length: $length)"
    echo -e "${BOLD_CYAN}╚══════════════════════════════════════════════════════════════════════════╝${NC}"
    read -p "Press Enter to continue..."
}

# New network statistics function
network_stats() {
    echo -e "${BOLD_CYAN}"
    echo "╔══════════════════════════ NETWORK STATISTICS ═══════════════════════════╗"
    echo -e "${NC}"
    
    echo -e "${NEON_GREEN}Active Connections:${NC}"
    netstat -tuln 2>/dev/null | grep -E '^(tcp|udp)'
    
    echo -e "\n${NEON_BLUE}Interface Statistics:${NC}"
    ifconfig | grep -E '^(eth|wlan|enp|wlp)' | awk '{print $1}'
    
    log_action "Network statistics viewed"
    echo -e "${BOLD_CYAN}╚══════════════════════════════════════════════════════════════════════════╝${NC}"
    read -p "Press Enter to continue..."
}

# New security audit function
security_audit() {
    echo -e "${BOLD_RED}"
    echo "╔══════════════════════════ SECURITY AUDIT ═══════════════════════════════╗"
    echo -e "${NC}"
    
    echo -e "${NEON_GREEN}Checking for failed login attempts...${NC}"
    lastb | head -10
    
    echo -e "\n${NEON_BLUE}Checking sudo activities...${NC}"
    grep -i 'sudo' /var/log/auth.log 2>/dev/null | tail -5 || echo "Log not available"
    
    echo -e "\n${NEON_PURPLE}Checking system updates...${NC}"
    pkg list-upgrades 2>/dev/null || echo "Update check not available"
    
    log_action "Security audit performed"
    echo -e "${BOLD_RED}╚══════════════════════════════════════════════════════════════════════════╝${NC}"
    read -p "Press Enter to continue..."
}

# New crypto tools function
crypto_tools() {
    echo -e "${BOLD_CYAN}"
    echo "╔══════════════════════════ CRYPTO TOOLS ═════════════════════════════════╗"
    echo -e "${NC}"
    
    echo "1. Generate SHA-256 Hash"
    echo "2. Generate MD5 Hash"
    echo "3. Generate RSA Key Pair"
    echo "4. Base64 Encode/Decode"
    
    read -p "Select crypto option: " crypto_choice
    
    case $crypto_choice in
        1)
            read -p "Enter text to hash: " hash_text
            echo -n "$hash_text" | sha256sum
            ;;
        2)
            read -p "Enter text to hash: " hash_text
            echo -n "$hash_text" | md5sum
            ;;
        3)
            echo -e "${NEON_GREEN}Generating RSA key pair...${NC}"
            openssl genrsa -out private.pem 2048 2>/dev/null
            openssl rsa -in private.pem -pubout -out public.pem 2>/dev/null
            echo "RSA keys generated: private.pem, public.pem"
            ;;
        4)
            read -p "Enter text to encode: " base64_text
            echo "Encoded: $(echo -n "$base64_text" | base64)"
            ;;
        *)
            echo -e "${BOLD_RED}Invalid option!${NC}"
            ;;
    esac
    
    log_action "Crypto tools used"
    echo -e "${BOLD_CYAN}╚══════════════════════════════════════════════════════════════════════════╝${NC}"
    read -p "Press Enter to continue..."
}

# New steganography tools function
steganography_tools() {
    echo -e "${BOLD_CYAN}"
    echo "╔════════════════════════ STEGANOGRAPHY TOOLS ════════════════════════════╗"
    echo -e "${NC}"
    
    if command -v steghide &> /dev/null; then
        echo "1. Hide file in image"
        echo "2. Extract file from image"
        read -p "Select option: " steg_choice
        
        case $steg_choice in
            1)
                read -p "Enter cover image: " cover_image
                read -p "Enter file to hide: " secret_file
                if [ -f "$cover_image" ] && [ -f "$secret_file" ]; then
                    steghide embed -cf "$cover_image" -ef "$secret_file"
                    echo -e "${BOLD_GREEN}File hidden successfully!${NC}"
                else
                    echo -e "${BOLD_RED}Files not found!${NC}"
                fi
                ;;
            2)
                read -p "Enter stego image: " stego_image
                if [ -f "$stego_image" ]; then
                    steghide extract -sf "$stego_image"
                    echo -e "${BOLD_GREEN}File extracted successfully!${NC}"
                else
                    echo -e "${BOLD_RED}File not found!${NC}"
                fi
                ;;
            *)
                echo -e "${BOLD_RED}Invalid option!${NC}"
                ;;
        esac
    else
        echo -e "${BOLD_YELLOW}Steghide not installed. Install with: pkg install steghide${NC}"
    fi
    
    log_action "Steganography tools accessed"
    echo -e "${BOLD_CYAN}╚══════════════════════════════════════════════════════════════════════════╝${NC}"
    read -p "Press Enter to continue..."
}

# Keep existing functions but add styling (process_monitor, disk_analyzer, speed_test, etc.)
process_monitor() {
    echo -e "${BOLD_CYAN}"
    echo "╔══════════════════════════ PROCESS MONITOR ══════════════════════════════╗"
    echo -e "${NC}"
    
    echo -e "${NEON_GREEN}Top CPU consuming processes:${NC}"
    ps aux --sort=-%cpu | head -10 | awk '{printf "%-10s %-10s %-10s %-50s\n", $2, $1, $3, $11}'
    
    echo -e "\n${NEON_BLUE}Top memory consuming processes:${NC}"
    ps aux --sort=-%mem | head -10 | awk '{printf "%-10s %-10s %-10s %-50s\n", $2, $1, $4, $11}'
    
    log_action "Process monitor executed"
    echo -e "${BOLD_CYAN}╚══════════════════════════════════════════════════════════════════════════╝${NC}"
    read -p "Press Enter to continue..."
}

disk_analyzer() {
    echo -e "${BOLD_CYAN}"
    echo "╔════════════════════════ DISK SPACE ANALYZER ════════════════════════════╗"
    echo -e "${NC}"
    
    echo -e "${NEON_GREEN}Disk usage summary:${NC}"
    df -h
    
    echo -e "\n${NEON_BLUE}Largest directories in home:${NC}"
    du -h "$HOME" --max-depth=1 2>/dev/null | sort -hr | head -10 | while read size path; do
        printf "%-10s %s\n" "$size" "$path"
    done
    
    log_action "Disk analysis performed"
    echo -e "${BOLD_CYAN}╚══════════════════════════════════════════════════════════════════════════╝${NC}"
    read -p "Press Enter to continue..."
}

speed_test() {
    echo -e "${BOLD_CYAN}"
    echo "╔══════════════════════════ NETWORK SPEED TEST ═══════════════════════════╗"
    echo -e "${NC}"
    
    echo -e "${NEON_GREEN}Testing download speed...${NC}"
    (curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -) 2>/dev/null || \
    echo -e "${BOLD_YELLOW}Speedtest not available. Install speedtest-cli${NC}"
    
    log_action "Network speed test performed"
    echo -e "${BOLD_CYAN}╚══════════════════════════════════════════════════════════════════════════╝${NC}"
    read -p "Press Enter to continue..."
}

system_update() {
    echo -e "${BOLD_CYAN}"
    echo "╔══════════════════════════ SYSTEM UPDATE ════════════════════════════════╗"
    echo -e "${NC}"
    
    echo -e "${NEON_GREEN}Checking for updates...${NC}"
    pkg update && pkg upgrade -y
    
    log_action "System update performed"
    echo -e "${BOLD_CYAN}╚══════════════════════════════════════════════════════════════════════════╝${NC}"
    read -p "Press Enter to continue..."
}

clear_logs() {
    echo -e "${BOLD_CYAN}"
    echo "╔══════════════════════════ CLEAR LOGS ═══════════════════════════════════╗"
    echo -e "${NC}"
    
    echo -n "" > "$LOG_FILE"
    echo -e "${BOLD_GREEN}Log file cleared successfully!${NC}"
    
    log_action "Logs cleared by user"
    echo -e "${BOLD_CYAN}╚══════════════════════════════════════════════════════════════════════════╝${NC}"
    read -p "Press Enter to continue..."
}

view_logs() {
    echo -e "${BOLD_CYAN}"
    echo "╔══════════════════════════ ACTIVITY LOG ═════════════════════════════════╗"
    echo -e "${NC}"
    
    if [ -f "$LOG_FILE" ]; then
        cat "$LOG_FILE"
    else
        echo -e "${BOLD_RED}No log file found!${NC}"
    fi
    
    echo -e "${BOLD_CYAN}╚══════════════════════════════════════════════════════════════════════════╝${NC}"
    read -p "Press Enter to continue..."
}

dns_lookup() {
    echo -e "${BOLD_CYAN}"
    echo "╔══════════════════════════ DNS LOOKUP ═══════════════════════════════════╗"
    echo -e "${NC}"
    
    read -p "Enter domain to lookup: " domain
    if [ -n "$domain" ]; then
        echo -e "${NEON_GREEN}Performing DNS lookup for: $domain${NC}"
        loading_bar 1
        nslookup "$domain"
        log_action "DNS lookup performed for: $domain"
    else
        echo -e "${BOLD_RED}No domain provided!${NC}"
    fi
    echo -e "${BOLD_CYAN}╚══════════════════════════════════════════════════════════════════════════╝${NC}"
    read -p "Press Enter to continue..."
}

# Enhanced exit function with animation
exit_script() {
    echo -e "\n${BOLD_RED}"
    echo "╔══════════════════════════════════════════════════════════════════════════╗"
    echo "║                     TERMINATING SECURE SESSION                         ║"
    echo "╚══════════════════════════════════════════════════════════════════════════╝"
    echo -e "${NC}"
    
    # Exit animation
    for i in {1..3}; do
        echo -ne "${BOLD_RED}▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓${NC}\r"
        sleep 0.1
        echo -ne "${BOLD_ORANGE}░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░${NC}\r"
        sleep 0.1
        echo -ne "${BOLD_YELLOW}▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒${NC}\r"
        sleep 0.1
    done
    
    echo -e "${BOLD_GREEN}Session terminated successfully. Stay secure!${NC}"
    log_action "Script terminated by user"
    sleep 1
    clear
    exit 0
}

# Main execution flow
main() {
    init_script
    show_header
    matrix_animation
    show_system_info
    show_network_info
    run_security_check
    show_tools_menu
}

# Error handling
trap 'echo -e "${BOLD_RED}Unexpected error occurred!${NC}"; log_action "Script error occurred"; exit 1' ERR

# Run main function
main "$@"