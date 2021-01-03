if which ./Pods/Sourcery/bin/sourcery >/dev/null; then
    ./Pods/Sourcery/bin/sourcery --config ./Pods/Sourcery/Config/Tests/Maniq.yml
    ./Pods/Sourcery/bin/sourcery --config ./Pods/Sourcery/Config/Tests/FirebaseService.yml
else
    echo "warning: Sourcery not installed"
fi
