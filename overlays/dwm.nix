(final: prev: {
    dwm = prev.dwm.overrideAttrs (oldattrs: {
        src = fetchGit {
            url = "https://github.com/rjmontgo/xy-dwm.git";
            rev = "21bfcb6d11ba7995fa0d3cf9ac371ba2bf1d5a60";
        }
    });
})
