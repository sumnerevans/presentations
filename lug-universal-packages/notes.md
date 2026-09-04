# AppImage Demo
Use the GitHub Desktop client as an example:

    wget https://github.com/shiftkey/desktop/releases/download/release-1.0.13/GitHubDesktop-linux-x86_64-1.0.13.AppImage
    chmod +x GitHubDesktop-linux-x86_64-1.0.13.AppImage
    ./GitHubDesktop-linux-x86_64-1.0.13.AppImage

# Snapd
https://snapcraft.io/inkscape/

    sudo snap install inkscape
    snap run inkscape

# Flatpak
https://fedoramagazine.org/getting-started-flatpak/
> The GNOME development team hosts a repository containing nightly builds of all
> the core GNOME apps, as well as many additional applications.

    flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
    flatpak install flathub org.armagetronad.ArmagetronAdvanced
    flatpak run org.armagetronad.ArmagetronAdvanced
