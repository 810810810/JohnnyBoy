# JohnnyBoy
Bash script that provides a user interface for advanced usage of John the Ripper, a popular password cracking tool.

The script prompts the user to input several parameters such as the path to the target file, the path to the wordlist file, the hash format types, and the attack mode. The script then uses these inputs to execute various John the Ripper commands to crack the password hashes.

The script supports several attack modes such as Wordlist, Mask, Incremental, External, and Hybrid. For each attack mode, the user can specify additional options to customize the attack. The script runs the selected attack mode for all specified hash types.

The final version of the script also includes error handling and prompts the user to confirm their inputs before running the attack. Overall, the script provides a user-friendly way to use John the Ripper for password cracking.
