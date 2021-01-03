if which ./Sourcery/bin/sourcery >/dev/null; then
    ./Sourcery/bin/sourcery --config ./Sourcery/Config/Express.yml
else
    echo "warning: Sourcery not installed"
fi
