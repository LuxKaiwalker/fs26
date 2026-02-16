# Tutorial

Open a link from `l.txt`:

```sh
xdg-open "$(grep script l.txt | awk '{print $2}' | sed 's|file://||')"
```

## Reusable command in `~/bin`

```sh
mkdir -p ~/bin

cat > ~/bin/open <<'EOF'
#!/bin/bash
flag="$1"
xdg-open "$(
    grep "^$flag " l.txt | awk '{print $2}' | sed 's|file://||'
)"
EOF

chmod +x ~/bin/open
export PATH="$HOME/bin:$PATH"
source ~/.bashrc
```
testing:
```
open script
open web
```

