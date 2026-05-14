gsettings set org.gnome.shell favorite-apps "[]"

sudo bash -c '  
find "./tools" -iname "*.desktop" -exec chown root:root {} \;
find "./tools" -iname "*.desktop" -exec chmod 755 {} \;
find "./tools" -iname "*.svg" -exec chown root:root {} \;
find "./tools" -iname "*.svg" -exec chmod 644 {} \;
find "./tools" -iname "*.desktop" -exec cp -p {} /usr/share/applications/ \;
find "./tools" -iname "*.svg" -exec cp -p {} /usr/share/pixmaps/ \;
'

DESIRED_ORDER=("nautilus" "chrome" "thunderbird" "anytype" "pomatez" "drawio" "excalidraw" "livebook" "alacritty" "neovim" "dbeaver"  "podman"  "deskflow")

VALIDATED_LIST=()
for app in "${DESIRED_ORDER[@]}"; do
    FILE_FOUND=$(find ./tools -name "$app.desktop" | head -n 1)

    if [ -n "$FILE_FOUND" ]; then
        VALIDATED_LIST+=("$app.desktop")
    else
        echo "Skipping $app: Not found anywhere inside ./tools"
    fi
done

FAVORITE_APPS=$(printf ",'%s'" "${VALIDATED_LIST[@]}")
FAVORITE_APPS="[${FAVORITE_APPS:1}]"

gsettings set org.gnome.shell favorite-apps "$FAVORITE_APPS"
echo "Dock updated with found apps: $FAVORITE_APPS"