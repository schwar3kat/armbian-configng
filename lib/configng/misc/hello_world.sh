#!/bin/bash

# Copyright (c) Authors: http://www.armbian.com/authors, info@armbian.com
#
# This file is licensed under the terms of the GNU General Public
# License version 2. This program is licensed "as is" without any
# warranty of any kind, whether express or implied.



# @description Hello World description.
#
# @exitcode 0  If successful.
#
# @options none
function hello::see_world(){

	echo "hello world"
    return 0
}



# @description Text-based User Input (read).
#
# @exitcode 0  If successful.
#
# @options none
function menu::see_read(){
    echo "Please select an action:"

    # Initialize an empty array to store the function keys
    declare -a function_keys

    # Loop through each key in the functions array
    local i=1
    for key in "${!functions[@]}"; do
        if [[ $key == *",function_name" ]]; then
            # Add the key to the function_keys array
            function_keys[i]="${key%,function_name}"

            # Display the function and its description as an option in the menu
            echo "$i. ${functions["${function_keys[i]},group_name"]} ${functions[$key]}  - ${functions["${function_keys[i]},description"]}"
            ((i++))
        fi
    done

    echo "$i. Show help"
    ((i++))
    echo "$i. Exit"

    read -p "Enter your choice: " choice

    if ((choice == i-1)); then
        see_help
        see_list
    elif ((choice == i)); then
        exit 0
    elif ((choice >= 1 && choice <= ${#function_keys[@]})); then
        # Call the selected function using variable indirection
        eval "${functions["${function_keys[choice]},group_name"]}::${functions["${function_keys[choice]},function_name"]}"
    else
        echo "Invalid choice"
    fi
}
