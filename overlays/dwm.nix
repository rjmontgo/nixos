(final: prev: {
    dwm = prev.dwm.overrideAttrs (oldattrs: {
        src = fetchGit {
            url = "https://github.com/rjmontgo/xy-dwm.git";
            rev = "94e4f452cf4eb49f224fdf2d3064775081855c58";
        }
    });

    st = prev.st.overrideAttrs (oldAttrs: {
        src = fetchGit {
            url = "https://github.com/rjmontgo/st.git";
            rev = "a56f3edf25d6838b67f32a979b9d0672ab1e3c16";
        }
    });
})
