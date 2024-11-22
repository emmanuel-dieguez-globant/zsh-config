#!/usr/bin/env bash
cout() {
    format=$1; shift
    echo -en "[${format}m""  $*""[0m"
}

main() {
    # Set the Internal Field Separator to 'new line'
    local IFS='
'
    brew update
    packages="$(brew cask list --versions)"

    for line in $packages; do
        local package=$(echo $line | cut -d' ' -f1)
        local version=$(echo $line | cut -d' ' -f2)
        local last_version=$(brew cask info $package | head -n1 | cut -d' ' -f2)

        if [[ $version != $last_version ]]; then
            cout "01;33" "[!] Updating $package $version -> $last_version\n"
            brew cask reinstall $package
        else
            cout "01;32" "[!] $package $version is up to date\n"
        fi
    done

    brew cask cleanup
}

# Invoke the main function
main