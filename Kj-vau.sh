#!/bin/bash

# =============================================
# HACKER TERMINAL SCRIPT
# CREATED BY : KHOKON TALUKDAR
# VERSION    : 2.0
# DESCRIPTION: Advanced Hacker Terminal Interface
# =============================================

# Color codes
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

# Animated header
show_header() {
    clear
    echo -e "${BOLD_GREEN}"
    echo "███████╗ ██████╗███████╗██████╗ ███████╗██████╗ "
    echo "██╔════╝██╔════╝██╔════╝██╔══██╗██╔════╝██╔══██╗"
    echo "███████╗██║     █████╗  ██████╔╝█████╗  ██████╔╝"
    echo "╚════██║██║     ██╔══╝  ██╔══██╗██╔══╝  ██╔══██╗"
    echo "███████║╚██████╗███████╗██║  ██║███████╗██║  ██║"
    echo "╚══════╝ ╚═════╝╚══════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝"
    echo -e "${NC}"
    
    echo -e "${BOLD_CYAN}"
    echo "┌────────────────────────────────────────────────┐"
    echo "│             SECURITY FRAMEWORK v2.0           │"
    echo "│             CREATED BY: KHOKON TALUKDAR       │"
    echo "└────────────────────────────────────────────────┘"
    echo -e "${NC}"
    sleep 1
}

# Matrix animation effect
matrix_animation() {
    echo -e "${BOLD_GREEN}"
    echo "INITIALIZING SECURE CONNECTION..."
    sleep 1
    
    local matrix_chars=("0" "1" " " "█" "▓" "▒" "░")
    for i in {1..10}; do
        local line=""
        for j in {1..50}; do
            local char=${matrix_chars[$RANDOM % ${#matrix_chars[@]}]}
            line+="$char"
        done
        echo "$line"
        sleep 0.1
    done
    echo -e "${NC}"
}

# System information
show_system_info() {
    echo -e "${BOLD_YELLOW}"
    echo "┌──────────────── SYSTEM INFORMATION ──────────────┐"
    echo -e "${BOLD_WHITE}"
    echo "  User        : $(whoami)"
    echo "  Hostname    : $(hostname)"
    echo "  OS          : $(uname -o)"
    echo "  Kernel      : $(uname -r)"
    echo "  Architecture: $(uname -m)"
    echo "  Uptime      : $(uptime -p | sed 's/up //')"
    echo "  Shell       : $(echo $SHELL)"
    echo "  Terminal    : $TERM"
    echo -e "${BOLD_YELLOW}"
    echo "└──────────────────────────────────────────────────┘"
    echo -e "${NC}"
    sleep 1
}

# Network information
show_network_info() {
    echo -e "${BOLD_BLUE}"
    echo "┌──────────────── NETWORK INFORMATION ─────────────┐"
    echo -e "${BOLD_WHITE}"
    
    # Get IP address
    local ip=$(ip route get 1 2>/dev/null | awk '{print $7}' | head -1)
    if [ -z "$ip" ]; then
        ip="Not Connected"
    fi
    
    echo "  IP Address  : $ip"
    echo "  Public IP   : $(curl -s ifconfig.me 2>/dev/null || echo 'Unknown')"
    echo "  DNS         : $(cat /etc/resolv.conf 2>/dev/null | grep nameserver | head -1 | awk '{print $2}')"
    
    # Check internet connectivity
    if ping -c 1 google.com &> /dev/null; then
        echo "  Status      : ${BOLD_GREEN}ONLINE${BOLD_WHITE}"
    else
        echo "  Status      : ${BOLD_RED}OFFLINE${BOLD_WHITE}"
    fi
    
    echo -e "${BOLD_BLUE}"
    echo "└──────────────────────────────────────────────────┘"
    echo -e "${NC}"
    sleep 1
}

# Security check
run_security_check() {
    echo -e "${BOLD_RED}"
    echo "┌──────────────── SECURITY SCAN ───────────────────┐"
    echo -e "${BOLD_WHITE}"
    
    echo -n "  Checking system integrity "
    for i in {1..5}; do
        echo -n "."
        sleep 0.3
    done
    echo " ${BOLD_GREEN}✓${BOLD_WHITE}"
    
    echo -n "  Scanning for vulnerabilities "
    for i in {1..5}; do
        echo -n "."
        sleep 0.3
    done
    echo " ${BOLD_GREEN}✓${BOLD_WHITE}"
    
    echo -n "  Verifying encryption "
    for i in {1..5}; do
        echo -n "."
        sleep 0.3
    done
    echo " ${BOLD_GREEN}✓${BOLD_WHITE}"
    
    echo -e "${BOLD_RED}"
    echo "└──────────────────────────────────────────────────┘"
    echo -e "${NC}"
    sleep 1
}

# Tools menu
show_tools_menu() {
    while true; do
        clear
        echo -e "${BOLD_PURPLE}"
        echo "┌───────────────── HACKER TOOLS ─────────────────┐"
        echo -e "${BOLD_WHITE}"
        echo "  1.  Network Scanner"
        echo "  2.  Port Scanner"
        echo "  3.  System Information"
        echo "  4.  File Encryptor"
        echo "  5.  Password Generator"
        echo "  6.  DNS Lookup"
        echo "  7.  Process Monitor"
        echo "  8.  Disk Space Analyzer"
        echo "  9.  Network Speed Test"
        echo "  10. System Update"
        echo "  11. Clear Logs"
        echo "  12. View Activity Log"
        echo "  0.  Exit"
        echo -e "${BOLD_PURPLE}"
        echo "└────────────────────────────────────────────────┘"
        echo -e "${NC}"
        
        read -p "Select an option (0-12): " choice
        
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
            0) exit_script ;;
            *) echo -e "${BOLD_RED}Invalid option! Please try again.${NC}"; sleep 2 ;;
        esac
    done
}

# Network scanner
network_scanner() {
    echo -e "${BOLD_CYAN}"
    echo "Starting Network Scanner..."
    echo -e "${NC}"
    
    if command -v nmap &> /dev/null; then
        read -p "Enter network range (e.g., 192.168.1.0/24): " network
        if [ -n "$network" ]; then
            nmap -sn "$network"
            log_action "Network scan performed on: $network"
        else
            echo -e "${BOLD_RED}No network range provided!${NC}"
        fi
    else
        echo -e "${BOLD_RED}nmap is not installed! Install with: pkg install nmap${NC}"
    fi
    read -p "Press Enter to continue..."
}

# Port scanner
port_scanner() {
    echo -e "${BOLD_CYAN}"
    echo "Starting Port Scanner..."
    echo -e "${NC}"
    
    if command -v nmap &> /dev/null; then
        read -p "Enter target IP or hostname: " target
        if [ -n "$target" ]; then
            nmap -sS "$target"
            log_action "Port scan performed on: $target"
        else
            echo -e "${BOLD_RED}No target provided!${NC}"
        fi
    else
        echo -e "${BOLD_RED}nmap is not installed!${NC}"
    fi
    read -p "Press Enter to continue..."
}

# File encryptor
file_encryptor() {
    echo -e "${BOLD_CYAN}"
    echo "File Encryptor"
    echo -e "${NC}"
    
    read -p "Enter file path to encrypt: " file_path
    if [ -f "$file_path" ]; then
        if command -v gpg &> /dev/null; then
            gpg -c "$file_path"
            echo -e "${BOLD_GREEN}File encrypted successfully!${NC}"
            log_action "File encrypted: $file_path"
        else
            echo -e "${BOLD_RED}gpg is not installed! Install with: pkg install gnupg${NC}"
        fi
    else
        echo -e "${BOLD_RED}File not found!${NC}"
    fi
    read -p "Press Enter to continue..."
}

# Password generator
password_generator() {
    echo -e "${BOLD_CYAN}"
    echo "Password Generator"
    echo -e "${NC}"
    
    read -p "Enter password length (default 12): " length
    length=${length:-12}
    
    password=$(tr -dc 'A-Za-z0-9!@#$%^&*()' < /dev/urandom | head -c "$length")
    echo -e "${BOLD_GREEN}Generated Password: $password${NC}"
    log_action "Password generated (length: $length)"
    read -p "Press Enter to continue..."
}

# DNS lookup
dns_lookup() {
    echo -e "${BOLD_CYAN}"
    echo "DNS Lookup"
    echo -e "${NC}"
    
    read -p "Enter domain name: " domain
    if [ -n "$domain" ]; then
        nslookup "$domain"
        log_action "DNS lookup for: $domain"
    else
        echo -e "${BOLD_RED}No domain provided!${NC}"
    fi
    read -p "Press Enter to continue..."
}

# Process monitor
process_monitor() {
    echo -e "${BOLD_CYAN}"
    echo "Process Monitor"
    echo -e "${NC}"
    
    ps aux --sort=-%cpu | head -10
    log_action "Process monitor executed"
    read -p "Press Enter to continue..."
}

# Disk space analyzer
disk_analyzer() {
    echo -e "${BOLD_CYAN}"
    echo "Disk Space Analyzer"
    echo -e "${NC}"
    
    df -h
    echo ""
    echo "Largest directories in home:"
    du -h "$HOME" --max-depth=1 2>/dev/null | sort -hr | head -10
    log_action "Disk analysis performed"
    read -p "Press Enter to continue..."
}

# Network speed test
speed_test() {
    echo -e "${BOLD_CYAN}"
    echo "Network Speed Test"
    echo -e "${NC}"
    
    if command -v speedtest-cli &> /dev/null; then
        speedtest-cli --simple
    else
        echo -e "${BOLD_YELLOW}Installing speedtest-cli...${NC}"
        pkg install speedtest-cli -y
        speedtest-cli --simple
    fi
    log_action "Speed test performed"
    read -p "Press Enter to continue..."
}

# System update
system_update() {
    echo -e "${BOLD_CYAN}"
    echo "System Update"
    echo -e "${NC}"
    
    echo -e "${BOLD_YELLOW}Updating package lists...${NC}"
    pkg update
    
    echo -e "${BOLD_YELLOW}Upgrading packages...${NC}"
    pkg upgrade -y
    
    echo -e "${BOLD_YELLOW}Cleaning up...${NC}"
    pkg autoclean
    
    echo -e "${BOLD_GREEN}System update completed!${NC}"
    log_action "System update performed"
    read -p "Press Enter to continue..."
}

# Clear logs
clear_logs() {
    echo -e "${BOLD_CYAN}"
    echo "Clearing Logs..."
    echo -e "${NC}"
    
    if [ -f "$LOG_FILE" ]; then
        rm "$LOG_FILE"
        touch "$LOG_FILE"
        echo -e "${BOLD_GREEN}Logs cleared successfully!${NC}"
        log_action "Logs cleared by user"
    else
        echo -e "${BOLD_RED}Log file not found!${NC}"
    fi
    read -p "Press Enter to continue..."
}

# View logs
view_logs() {
    echo -e "${BOLD_CYAN}"
    echo "Activity Log"
    echo -e "${NC}"
    
    if [ -f "$LOG_FILE" ] && [ -s "$LOG_FILE" ]; then
        cat "$LOG_FILE"
    else
        echo -e "${BOLD_YELLOW}No log entries found.${NC}"
    fi
    read -p "Press Enter to continue..."
}

# Exit script
exit_script() {
    echo -e "${BOLD_GREEN}"
    echo "Thank you for using Hacker Terminal!"
    echo "Created by: Khokon Talukdar"
    echo -e "${NC}"
    log_action "Script terminated by user"
    sleep 2
    clear
    exit 0
}

# Main function
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
set -e
trap "echo -e '${BOLD_RED}Script interrupted!${NC}'; exit 1" SIGINT

# Run main function
main "$@"