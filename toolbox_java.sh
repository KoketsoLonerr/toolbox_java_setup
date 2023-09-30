#!/bin/bash

# Function to check for and install Java
install_java() {
    if ! java -version 2>&1 | grep -q 'openjdk' ; then
        echo "Java not found. Installing OpenJDK..."
        sudo apt-get update
        sudo apt-get install openjdk-11-jdk -y
    fi
}

# Function to install JetBrains Toolbox
install_toolbox() {
    echo "Downloading JetBrains Toolbox..."
    TOOLBOX_URL="https://download.jetbrains.com/toolbox/jetbrains-toolbox-2.0.4.17212.tar.gz"
    wget -c "$TOOLBOX_URL" -O jetbrains-toolbox.tar.gz
    tar -xzf jetbrains-toolbox.tar.gz
    rm jetbrains-toolbox.tar.gz
    chmod +x jetbrains-toolbox-*/jetbrains-toolbox
    ./jetbrains-toolbox-*/jetbrains-toolbox
}

# Main script
echo "Installing JetBrains Toolbox and setting up Java..."

install_java
install_toolbox

echo "Done installing the toolbox and setting up Java!!!"
