front-end menu-driven interface for executing various scripts and functions. It tries to simplify the process of creating and managing configuration options. Here's how you can create a new menu entry:

1. **Create a bash script**: This file should contain commands to configure your computer to run.
    - Here's an example of a bash script that you can use as a menu entry:

```bash
# @description Hello World description.
#
# @exitcode 0  If successful.
#
# @options none
function hello::see_world(){

	echo "hello world"
    return 0
}

# @description test description.
#
# @exitcode 0  If successful.
#
# @options none
function tests::see_test(){

	echo "hello world"
    return 0
}
```
Add a description: At the top of your main function in your bash script, add a special comment that starts with # @description. This comment should explain what your script does.

Save your script: Save this file in the lib/configng/$folder/ directory. Replace $folder with the name of the folder where you want to save your script.

Run Jampi-Config: Now, when you run Jampi-Config, it will automatically find your new script and add a new entry to the menu.

# Understanding Folders and Categories: 

In Jampi-Config, folders are used to organize scripts into categories. Each subfolder in the lib/configng/ directory represents a category in the menu. When you select a category, it will open a submenu containing all the scripts in that category’s folder. So, make sure to place your script in an appropriate category folder.


License
This program is licensed under the terms of the GNU General Public License version 2.

For more information, contact the authors at info@armbian.com.
