#!/bin/zsh

# List of compromised packages with their affected versions
# Format: "package@version"
CHECKS=(
  "@ahmedhfarag/ngx-perfect-scrollbar@20.0.20"
  "@ahmedhfarag/ngx-virtual-scroller@4.0.4"
  "@art-ws/common@2.0.22" "@art-ws/common@2.0.28"
  "@art-ws/config-eslint@2.0.4" "@art-ws/config-eslint@2.0.5"
  "@art-ws/config-ts@2.0.7" "@art-ws/config-ts@2.0.8"
  "@art-ws/db-context@2.0.24"
  "@art-ws/di@2.0.28" "@art-ws/di@2.0.32"
  "@art-ws/di-node@2.0.13"
  "@art-ws/eslint@1.0.5" "@art-ws/eslint@1.0.6"
  "@art-ws/fastify-http-server@2.0.24" "@art-ws/fastify-http-server@2.0.27"
  "@art-ws/http-server@2.0.21" "@art-ws/http-server@2.0.25"
  "@art-ws/openapi@0.1.9" "@art-ws/openapi@0.1.12"
  "@art-ws/package-base@1.0.5" "@art-ws/package-base@1.0.6"
  "@art-ws/prettier@1.0.5" "@art-ws/prettier@1.0.6"
  "@art-ws/slf@2.0.15" "@art-ws/slf@2.0.22"
  "@art-ws/ssl-info@1.0.9" "@art-ws/ssl-info@1.0.10"
  "@art-ws/web-app@1.0.3" "@art-ws/web-app@1.0.4"
  "@crowdstrike/commitlint@8.1.1" "@crowdstrike/commitlint@8.1.2"
  "@crowdstrike/falcon-shoelace@0.4.1" "@crowdstrike/falcon-shoelace@0.4.2"
  "@crowdstrike/foundry-js@0.19.1" "@crowdstrike/foundry-js@0.19.2"
  "@crowdstrike/glide-core@0.34.2" "@crowdstrike/glide-core@0.34.3"
  "@crowdstrike/logscale-dashboard@1.205.1" "@crowdstrike/logscale-dashboard@1.205.2"
  "@crowdstrike/logscale-file-editor@1.205.1" "@crowdstrike/logscale-file-editor@1.205.2"
  "@crowdstrike/logscale-parser-edit@1.205.1" "@crowdstrike/logscale-parser-edit@1.205.2"
  "@crowdstrike/logscale-search@1.205.1" "@crowdstrike/logscale-search@1.205.2"
  "@crowdstrike/tailwind-toucan-base@5.0.1" "@crowdstrike/tailwind-toucan-base@5.0.2"
  "@ctrl/deluge@7.2.1" "@ctrl/deluge@7.2.2"
  "@ctrl/golang-template@1.4.2" "@ctrl/golang-template@1.4.3"
  "@ctrl/magnet-link@4.0.3" "@ctrl/magnet-link@4.0.4"
  "@ctrl/ngx-codemirror@7.0.1" "@ctrl/ngx-codemirror@7.0.2"
  "@ctrl/ngx-csv@6.0.1" "@ctrl/ngx-csv@6.0.2"
  "@ctrl/ngx-emoji-mart@9.2.1" "@ctrl/ngx-emoji-mart@9.2.2"
  "@ctrl/ngx-rightclick@4.0.1" "@ctrl/ngx-rightclick@4.0.2"
  "@ctrl/qbittorrent@9.7.1" "@ctrl/qbittorrent@9.7.2"
  "@ctrl/react-adsense@2.0.1" "@ctrl/react-adsense@2.0.2"
  "@ctrl/shared-torrent@6.3.1" "@ctrl/shared-torrent@6.3.2"
  "@ctrl/tinycolor@4.1.1" "@ctrl/tinycolor@4.1.2"
  "@ctrl/torrent-file@4.1.1" "@ctrl/torrent-file@4.1.2"
  "@ctrl/transmission@7.3.1"
  "@ctrl/ts-base32@4.0.1" "@ctrl/ts-base32@4.0.2"
)

for entry in "${CHECKS[@]}"; do
  pkg="${entry%@*}"
  ver="${entry#*@}"
  echo "🔎 Searching for $pkg@$ver ..."
  find . -type f -path "*/node_modules/$pkg/package.json" 2>/dev/null \
    -exec grep -H "\"version\": \"$ver\"" {} \;
done
