#! /usr/bin/env bash

{

cat <<'EOF'
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>random-pages</title>
  </head>
  <body>
    <h1>random-pages</h1>
    <div id="files">
EOF

find . -name '*.html' -printf '%P\n' | while read html_path; do
  [[ "$html_path" == "index.html" ]] && continue
  # TODO urlencode + escape special chars
  # but "clean" file paths dont need escaping
  printf '      <div><a href="%s">%s</a></div>\n' "$html_path" "$html_path"
done

cat <<'EOF'
    </div>
  </body>
</html>
EOF

} >index.html

echo done index.html
