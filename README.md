My Scripts
===============================

This repository contains a collection of scripts that I use.

Usage
-----

To use these scripts, simply clone this repository to your local machine, and navigate to the directory where the scripts are located.

### List Installed Packages

To generate a list of installed packages, run the `generate_package_lists.sh` script. This script will create three text files in the `package_lists` directory, one for packages installed from the official repositories, one for packages installed from the AUR, and one for flatpak packages.

### Install Packages

To install packages from the generated package lists, run the `install_packages.sh` script. This script will prompt you to select which package file(s) you want to install from, as well as which package manager you want to use for installing official packages (pacman or yay). You can choose to install packages from one or more of the generated package lists, or install packages from all three lists.

Contributing
------------

If you find any issues or bugs in these scripts, or if you have any suggestions for improvements or new features, please feel free to open an issue or pull request on this repository.

License
-------

This repository is licensed under the [MIT License](https://opensource.org/licenses/MIT). Feel free to use these scripts however you like, but please note that I am not responsible for any damage or data loss that may occur as a result of running these scripts.
