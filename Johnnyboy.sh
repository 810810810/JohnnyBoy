#!/bin/bash

# User interface for John the Ripper
# Allows for advanced usage of John the Ripper with various options and attack modes

# Get target file
read -r -p "Enter the path to the target file: " target_file
 
# Get wordlist file
read -r -p "Enter the path to the wordlist file: " wordlist_file

# Get format types
read -r -p "Enter the format types of the hashes (comma-separated, e.g. md5, sha256): " hash_types

# Get attack mode
echo "Select an attack mode:"
select attack_mode in "Wordlist" "Mask" "Incremental" "External" "Hybrid"
do
  case $attack_mode in
    Wordlist)
      # Get additional options
      read -r -p "Enter any additional options (e.g. --rules, --session, etc.): " additional_options
      # Run John the Ripper in wordlist mode for all hash types
      for hash_type in $(echo "$hash_types" | tr "," "\n")
      do
        john --format="$hash_type" "$target_file" --wordlist="$wordlist_file" "$additional_options"
      done
      break
      ;;
    Mask)
      # Get mask string
      read -r -p "Enter the mask string (e.g. ?d?d?d?d?d?d): " mask_string
      # Get additional options
      read -r -p "Enter any additional options (e.g. --rules, --session, etc.): " additional_options
      # Run John the Ripper in mask mode for all hash types
      for hash_type in $(echo "$hash_types" | tr "," "\n")
      do
        john --format="$hash_type" "$target_file" --mask="$mask_string" "$additional_options"
      done
      break
      ;;
    Incremental)
      # Get additional options
      read -r -p "Enter any additional options (e.g. --session, etc.): " additional_options
      # Run John the Ripper in incremental mode for all hash types
      for hash_type in $(echo "$hash_types" | tr "," "\n")
      do
        john --format="$hash_type" "$target_file" --incremental "$additional_options"
      done
      break
      ;;
    External)
      # Get external mode command
      read -r -p "Enter the command to use for external mode: " external_mode_command
      # Get additional options
      read -r -p "Enter any additional options (e.g. --session, etc.): " additional_options
      # Run John the Ripper in external mode for all hash types
      for hash_type in $(echo "$hash_types" | tr "," "\n")
      do
        john --format="$hash_type" "$target_file" --external="$external_mode_command" "$additional_options"
      done
      break
      ;;
    Hybrid)
      # Get wordlist file for hybrid mode
      read -r -p "Enter the path to the wordlist file for the hybrid mode: " wordlist_file_hybrid
      # Get additional options
      read -r -p "Enter any additional options (e.g. --rules, --session, etc.): " additional_options
      # Run John the Ripper in hybrid mode for all hash types
      for hash_type in $(echo "$hash_types" | tr "," "\n")
      do
        john --format="$hash_type" "$target_file" -- --wordlist="$wordlist_file_hybrid" "$additional_options"
      done
      break
      ;;
    *)
      echo "Invalid attack mode selected"
      ;;
  esac
done
