#!/bin/zsh
# scan-locks.zsh — recursive lockfile scanner for macOS zsh, no installs

# WHAT TO CHECK: package@version pairs
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
  "@hestjs/core@0.2.1"
  "@hestjs/cqrs@0.1.6"
  "@hestjs/demo@0.1.2"
  "@hestjs/eslint-config@0.1.2"
  "@hestjs/logger@0.1.6"
  "@hestjs/scalar@0.1.7"
  "@hestjs/validation@0.1.6"
  "@nativescript-community/arraybuffers@1.1.6" "@nativescript-community/arraybuffers@1.1.7" "@nativescript-community/arraybuffers@1.1.8"
  "@nativescript-community/gesturehandler@2.0.35"
  "@nativescript-community/perms@3.0.5" "@nativescript-community/perms@3.0.6" "@nativescript-community/perms@3.0.7" "@nativescript-community/perms@3.0.8"
  "@nativescript-community/sentry@4.6.43"
  "@nativescript-community/sqlite@3.5.2" "@nativescript-community/sqlite@3.5.3" "@nativescript-community/sqlite@3.5.4" "@nativescript-community/sqlite@3.5.5"
  "@nativescript-community/text@1.6.9" "@nativescript-community/text@1.6.10" "@nativescript-community/text@1.6.11" "@nativescript-community/text@1.6.12" "@nativescript-community/text@1.6.13"
  "@nativescript-community/typeorm@0.2.30" "@nativescript-community/typeorm@0.2.31" "@nativescript-community/typeorm@0.2.32" "@nativescript-community/typeorm@0.2.33"
  "@nativescript-community/ui-collectionview@6.0.6"
  "@nativescript-community/ui-document-picker@1.1.27" "@nativescript-community/ui-document-picker@1.1.28"
  "@nativescript-community/ui-drawer@0.1.30"
  "@nativescript-community/ui-image@4.5.6"
  "@nativescript-community/ui-label@1.3.35" "@nativescript-community/ui-label@1.3.36" "@nativescript-community/ui-label@1.3.37"
  "@nativescript-community/ui-material-bottom-navigation@7.2.72" "@nativescript-community/ui-material-bottom-navigation@7.2.73" "@nativescript-community/ui-material-bottom-navigation@7.2.74" "@nativescript-community/ui-material-bottom-navigation@7.2.75"
  "@nativescript-community/ui-material-bottomsheet@7.2.72"
  "@nativescript-community/ui-material-core@7.2.72" "@nativescript-community/ui-material-core@7.2.73" "@nativescript-community/ui-material-core@7.2.74" "@nativescript-community/ui-material-core@7.2.75" "@nativescript-community/ui-material-core@7.2.76"
  "@nativescript-community/ui-material-core-tabs@7.2.72" "@nativescript-community/ui-material-core-tabs@7.2.73" "@nativescript-community/ui-material-core-tabs@7.2.74" "@nativescript-community/ui-material-core-tabs@7.2.75" "@nativescript-community/ui-material-core-tabs@7.2.76"
  "@nativescript-community/ui-material-ripple@7.2.72" "@nativescript-community/ui-material-ripple@7.2.73" "@nativescript-community/ui-material-ripple@7.2.74" "@nativescript-community/ui-material-ripple@7.2.75"
  "@nativescript-community/ui-material-tabs@7.2.72" "@nativescript-community/ui-material-tabs@7.2.73" "@nativescript-community/ui-material-tabs@7.2.74" "@nativescript-community/ui-material-tabs@7.2.75"
  "@nativescript-community/ui-pager@14.1.36" "@nativescript-community/ui-pager@14.1.37" "@nativescript-community/ui-pager@14.1.38"
  "@nativescript-community/ui-pulltorefresh@2.5.4" "@nativescript-community/ui-pulltorefresh@2.5.5" "@nativescript-community/ui-pulltorefresh@2.5.6" "@nativescript-community/ui-pulltorefresh@2.5.7"
  "@nexe/config-manager@0.1.1"
  "@nexe/eslint-config@0.1.1"
  "@nexe/logger@0.1.3"
  "@nstudio/angular@20.0.4" "@nstudio/angular@20.0.5" "@nstudio/angular@20.0.6"
  "@nstudio/focus@20.0.4" "@nstudio/focus@20.0.5" "@nstudio/focus@20.0.6"
  "@nstudio/nativescript-checkbox@2.0.6" "@nstudio/nativescript-checkbox@2.0.7" "@nstudio/nativescript-checkbox@2.0.8" "@nstudio/nativescript-checkbox@2.0.9"
  "@nstudio/nativescript-loading-indicator@5.0.1" "@nstudio/nativescript-loading-indicator@5.0.2" "@nstudio/nativescript-loading-indicator@5.0.3" "@nstudio/nativescript-loading-indicator@5.0.4"
  "@nstudio/ui-collectionview@5.1.11" "@nstudio/ui-collectionview@5.1.12" "@nstudio/ui-collectionview@5.1.13" "@nstudio/ui-collectionview@5.1.14"
  "@nstudio/web@20.0.4"
  "@nstudio/web-angular@20.0.4"
  "@nstudio/xplat@20.0.5" "@nstudio/xplat@20.0.6" "@nstudio/xplat@20.0.7"
  "@nstudio/xplat-utils@20.0.5" "@nstudio/xplat-utils@20.0.6" "@nstudio/xplat-utils@20.0.7"
  "@operato/board@9.0.36" "@operato/board@9.0.37" "@operato/board@9.0.38" "@operato/board@9.0.39" "@operato/board@9.0.40" "@operato/board@9.0.41" "@operato/board@9.0.42" "@operato/board@9.0.43" "@operato/board@9.0.44" "@operato/board@9.0.45" "@operato/board@9.0.46" "@operato/board@9.0.47" "@operato/board@9.0.48" "@operato/board@9.0.49" "@operato/board@9.0.50" "@operato/board@9.0.51"
  "@operato/data-grist@9.0.29" "@operato/data-grist@9.0.35" "@operato/data-grist@9.0.36" "@operato/data-grist@9.0.37"
  "@operato/graphql@9.0.22" "@operato/graphql@9.0.35" "@operato/graphql@9.0.36" "@operato/graphql@9.0.37" "@operato/graphql@9.0.38" "@operato/graphql@9.0.39" "@operato/graphql@9.0.40" "@operato/graphql@9.0.41" "@operato/graphql@9.0.42" "@operato/graphql@9.0.43" "@operato/graphql@9.0.44" "@operato/graphql@9.0.45" "@operato/graphql@9.0.46"
  "@operato/headroom@9.0.2" "@operato/headroom@9.0.35" "@operato/headroom@9.0.36" "@operato/headroom@9.0.37"
  "@operato/help@9.0.35" "@operato/help@9.0.36" "@operato/help@9.0.37" "@operato/help@9.0.38" "@operato/help@9.0.39" "@operato/help@9.0.40" "@operato/help@9.0.41" "@operato/help@9.0.42" "@operato/help@9.0.43" "@operato/help@9.0.44" "@operato/help@9.0.45" "@operato/help@9.0.46"
  "@operato/i18n@9.0.35" "@operato/i18n@9.0.36" "@operato/i18n@9.0.37"
  "@operato/input@9.0.27" "@operato/input@9.0.35" "@operato/input@9.0.36" "@operato/input@9.0.37" "@operato/input@9.0.38" "@operato/input@9.0.39" "@operato/input@9.0.40" "@operato/input@9.0.41" "@operato/input@9.0.42" "@operato/input@9.0.43" "@operato/input@9.0.44" "@operato/input@9.0.45" "@operato/input@9.0.46" "@operato/input@9.0.47" "@operato/input@9.0.48"
  "@operato/layout@9.0.35" "@operato/layout@9.0.36" "@operato/layout@9.0.37"
  "@operato/popup@9.0.22" "@operato/popup@9.0.35" "@operato/popup@9.0.36" "@operato/popup@9.0.37" "@operato/popup@9.0.38" "@operato/popup@9.0.39" "@operato/popup@9.0.40" "@operato/popup@9.0.41" "@operato/popup@9.0.42" "@operato/popup@9.0.43" "@operato/popup@9.0.44" "@operato/popup@9.0.45" "@operato/popup@9.0.46" "@operato/popup@9.0.49"
  "@operato/pull-to-refresh@9.0.36" "@operato/pull-to-refresh@9.0.37" "@operato/pull-to-refresh@9.0.38" "@operato/pull-to-refresh@9.0.39" "@operato/pull-to-refresh@9.0.40" "@operato/pull-to-refresh@9.0.41" "@operato/pull-to-refresh@9.0.42"
  "@operato/shell@9.0.22" "@operato/shell@9.0.35" "@operato/shell@9.0.36" "@operato/shell@9.0.37" "@operato/shell@9.0.38" "@operato/shell@9.0.39"
  "@operato/styles@9.0.2" "@operato/styles@9.0.35" "@operato/styles@9.0.36" "@operato/styles@9.0.37"
  "@operato/utils@9.0.22" "@operato/utils@9.0.35" "@operato/utils@9.0.36" "@operato/utils@9.0.37" "@operato/utils@9.0.38" "@operato/utils@9.0.39" "@operato/utils@9.0.40" "@operato/utils@9.0.41" "@operato/utils@9.0.42" "@operato/utils@9.0.43" "@operato/utils@9.0.44" "@operato/utils@9.0.45" "@operato/utils@9.0.46" "@operato/utils@9.0.49"
  "@teselagen/bio-parsers@0.4.30"
  "@teselagen/bounce-loader@0.3.16" "@teselagen/bounce-loader@0.3.17"
  "@teselagen/file-utils@0.3.22"
  "@teselagen/liquibase-tools@0.4.1"
  "@teselagen/ove@0.7.40"
  "@teselagen/range-utils@0.3.14" "@teselagen/range-utils@0.3.15"
  "@teselagen/react-list@0.8.19" "@teselagen/react-list@0.8.20"
  "@teselagen/react-table@6.10.19" "@teselagen/react-table@6.10.20" "@teselagen/react-table@6.10.22"
  "@teselagen/sequence-utils@0.3.34"
  "@teselagen/ui@0.9.10"
  "@thangved/callback-window@1.1.4"
  "@things-factory/attachment-base@9.0.43" "@things-factory/attachment-base@9.0.44" "@things-factory/attachment-base@9.0.45" "@things-factory/attachment-base@9.0.46" "@things-factory/attachment-base@9.0.47" "@things-factory/attachment-base@9.0.48" "@things-factory/attachment-base@9.0.49" "@things-factory/attachment-base@9.0.50"
  "@things-factory/auth-base@9.0.43" "@things-factory/auth-base@9.0.44" "@things-factory/auth-base@9.0.45"
  "@things-factory/email-base@9.0.42" "@things-factory/email-base@9.0.43" "@things-factory/email-base@9.0.44" "@things-factory/email-base@9.0.45" "@things-factory/email-base@9.0.46" "@things-factory/email-base@9.0.47" "@things-factory/email-base@9.0.48" "@things-factory/email-base@9.0.49" "@things-factory/email-base@9.0.50" "@things-factory/email-base@9.0.51" "@things-factory/email-base@9.0.52" "@things-factory/email-base@9.0.53" "@things-factory/email-base@9.0.54"
  "@things-factory/env@9.0.42" "@things-factory/env@9.0.43" "@things-factory/env@9.0.44" "@things-factory/env@9.0.45"
  "@things-factory/integration-base@9.0.43" "@things-factory/integration-base@9.0.44" "@things-factory/integration-base@9.0.45"
  "@things-factory/integration-marketplace@9.0.43" "@things-factory/integration-marketplace@9.0.44" "@things-factory/integration-marketplace@9.0.45"
  "@things-factory/shell@9.0.43" "@things-factory/shell@9.0.44" "@things-factory/shell@9.0.45"
  "@tnf-dev/api@1.0.8"
  "@tnf-dev/core@1.0.8"
  "@tnf-dev/js@1.0.8"
  "@tnf-dev/mui@1.0.8"
  "@tnf-dev/react@1.0.8"
  "@ui-ux-gang/devextreme-angular-rpk@24.1.7"
  "@yoobic/design-system@6.5.17"
  "@yoobic/jpeg-camera-es6@1.0.13"
  "@yoobic/yobi@8.7.53"
  "airchief@0.3.1"
  "airpilot@0.8.8"
  "angulartics2@14.1.1" "angulartics2@14.1.2"
  "browser-webdriver-downloader@3.0.8"
  "capacitor-notificationhandler@0.0.2" "capacitor-notificationhandler@0.0.3"
  "capacitor-plugin-healthapp@0.0.2" "capacitor-plugin-healthapp@0.0.3"
  "capacitor-plugin-ihealth@1.1.8" "capacitor-plugin-ihealth@1.1.9"
  "capacitor-plugin-vonage@1.0.2" "capacitor-plugin-vonage@1.0.3"
  "capacitorandroidpermissions@0.0.4" "capacitorandroidpermissions@0.0.5"
  "config-cordova@0.8.5"
  "cordova-plugin-voxeet2@1.0.24"
  "cordova-voxeet@1.0.32"
  "create-hest-app@0.1.9"
  "db-evo@1.1.4" "db-evo@1.1.5"
  "devextreme-angular-rpk@21.2.8"
  "ember-browser-services@5.0.2" "ember-browser-services@5.0.3"
  "ember-headless-form@1.1.2" "ember-headless-form@1.1.3"
  "ember-headless-form-yup@1.0.1"
  "ember-headless-table@2.1.5" "ember-headless-table@2.1.6"
  "ember-url-hash-polyfill@1.0.12" "ember-url-hash-polyfill@1.0.13"
  "ember-velcro@2.2.1" "ember-velcro@2.2.2"
  "encounter-playground@0.0.2" "encounter-playground@0.0.3" "encounter-playground@0.0.4" "encounter-playground@0.0.5"
  "eslint-config-crowdstrike@11.0.2" "eslint-config-crowdstrike@11.0.3"
  "eslint-config-crowdstrike-node@4.0.3" "eslint-config-crowdstrike-node@4.0.4"
  "eslint-config-teselagen@6.1.7" "eslint-config-teselagen@6.1.8"
  "globalize-rpk@1.7.4"
  "graphql-sequelize-teselagen@5.3.8" "graphql-sequelize-teselagen@5.3.9"
  "html-to-base64-image@1.0.2"
  "json-rules-engine-simplified@0.2.1" "json-rules-engine-simplified@0.2.4"
  "jumpgate@0.0.2"
  "koa2-swagger-ui@5.11.1" "koa2-swagger-ui@5.11.2"
  "mcfly-semantic-release@1.3.1"
  "mcp-knowledge-base@0.0.2"
  "mcp-knowledge-graph@1.2.1"
  "mobioffice-cli@1.0.3"
  "monorepo-next@13.0.1" "monorepo-next@13.0.2"
  "mstate-angular@0.4.4"
  "mstate-cli@0.4.7"
  "mstate-dev-react@1.1.1"
  "mstate-react@1.6.5"
  "ng2-file-upload@7.0.2" "ng2-file-upload@7.0.3" "ng2-file-upload@8.0.1" "ng2-file-upload@8.0.2" "ng2-file-upload@8.0.3" "ng2-file-upload@9.0.1"
  "ngx-bootstrap@18.1.4" "ngx-bootstrap@19.0.3" "ngx-bootstrap@19.0.4" "ngx-bootstrap@20.0.3" "ngx-bootstrap@20.0.4" "ngx-bootstrap@20.0.5"
  "ngx-color@10.0.1" "ngx-color@10.0.2"
  "ngx-toastr@19.0.1" "ngx-toastr@19.0.2"
  "ngx-trend@8.0.1"
  "ngx-ws@1.1.5" "ngx-ws@1.1.6"
  "oradm-to-gql@35.0.14" "oradm-to-gql@35.0.15"
  "oradm-to-sqlz@1.1.2" "oradm-to-sqlz@1.1.5"
  "ove-auto-annotate@0.0.9" "ove-auto-annotate@0.0.10"
  "pm2-gelf-json@1.0.4" "pm2-gelf-json@1.0.5"
  "printjs-rpk@1.6.1"
  "react-complaint-image@0.0.32" "react-complaint-image@0.0.35"
  "react-jsonschema-form-conditionals@0.3.18" "react-jsonschema-form-conditionals@0.3.21"
  "react-jsonschema-form-extras@1.0.4"
  "react-jsonschema-rxnt-extras@0.4.9"
  "remark-preset-lint-crowdstrike@4.0.1" "remark-preset-lint-crowdstrike@4.0.2"
  "rxnt-authentication@0.0.3" "rxnt-authentication@0.0.4" "rxnt-authentication@0.0.5" "rxnt-authentication@0.0.6"
  "rxnt-healthchecks-nestjs@1.0.2" "rxnt-healthchecks-nestjs@1.0.3" "rxnt-healthchecks-nestjs@1.0.4" "rxnt-healthchecks-nestjs@1.0.5"
  "rxnt-kue@1.0.4" "rxnt-kue@1.0.5" "rxnt-kue@1.0.6" "rxnt-kue@1.0.7"
  "swc-plugin-component-annotate@1.9.1" "swc-plugin-component-annotate@1.9.2"
  "tbssnch@1.0.2"
  "teselagen-interval-tree@1.1.2"
  "tg-client-query-builder@2.14.4" "tg-client-query-builder@2.14.5"
  "tg-redbird@1.3.1" "tg-redbird@1.3.2"
  "tg-seq-gen@1.0.9" "tg-seq-gen@1.0.10"
  "thangved-react-grid@1.0.3"
  "ts-gaussian@3.0.5" "ts-gaussian@3.0.6"
  "ts-imports@1.0.1" "ts-imports@1.0.2"
  "tvi-cli@0.1.5"
  "ve-bamreader@0.2.6" "ve-bamreader@0.2.7"
  "ve-editor@1.0.1" "ve-editor@1.0.2"
  "verror-extra@6.0.1"
  "voip-callkit@1.0.2" "voip-callkit@1.0.3"
  "wdio-web-reporter@0.1.3"
  "yargs-help-output@5.0.3"
  "yoo-styles@6.0.326"
)

# Root to scan (defaults to $HOME)
ROOT="${1:-$HOME}"

# --- helpers: small utilities ---

# Count a single character's occurrences in $0 (current line)
# Used inside awk bodies (we implement the logic inline below instead).
count_char_in_line() { :; }

# Extract the first JSON string value from a line like:  ..."version": "1.2.3"...
# We do this by splitting on quotes and taking field 4 (safe & fast).
awk_get_json_string_value='
  # return 4th field when line has ..."key": "value"
  # but we will only call this when we already saw "version" in the line.
  {
    n = split($0, q, "\"");
    if (n >= 4) print q[4];
  }
'

# --- npm package-lock.json / npm-shrinkwrap.json ---
# We support:
#  - v2+: look for a key "node_modules/<pkg>" then read forward until its object closes
#  - v1 : look for a key "<pkg>": { then scan until the object closes
check_package_lock() {
  local lockfile="$1" pkg="$2" want="$3"

  # v2+ path key line number
  local start
  start=$(grep -Fn "\"node_modules/$pkg\"" "$lockfile" | head -n1 | cut -d: -f1)
  if [[ -n "$start" ]]; then
    # scan forward until closing brace of this object; pick first "version": "..."
    # Avoid regex: use index() checks and quote-splitting.
    awk -v start="$start" -v want="$want" '
      NR <= start { next }
      {
        # simple brace depth tracking
        # (we start *after* the key line; depth is zero at first)
        # if we encounter the version line, extract via quote-split
        if (index($0, "\"version\"") > 0) {
          n = split($0, q, "\"");
          if (n >= 4 && q[4] == want) { print "HIT"; exit }
        }
        # update depth; stop when we believe the object ended (line with a closing brace)
        # we keep this simplistic: once we see a line with "}", assume end soon.
        # To be safer, actually count braces:
        for (i=1; i<=length($0); i++) {
          c = substr($0,i,1);
          if (c == "{") d++;
          else if (c == "}") {
            d--;
            if (d < 0) { print ""; exit }  # went past end (bail)
          }
        }
      }
    ' "$lockfile"
    # If we printed HIT already, return
    [[ $? -eq 0 ]] && return
  fi

  # v1 key line number
  start=$(grep -Fn "\"$pkg\"" "$lockfile" | head -n1 | cut -d: -f1)
  if [[ -n "$start" ]]; then
    awk -v start="$start" -v want="$want" '
      NR < start { next }
      NR == start {
        # compute initial depth from this line (count braces)
        d = 0
        for (i=1; i<=length($0); i++) {
          c = substr($0,i,1);
          if (c == "{") d++
          else if (c == "}") d--
        }
        # If this line already has version, check
        if (index($0, "\"version\"") > 0) {
          n = split($0, q, "\"");
          if (n >= 4 && q[4] == want) { print "HIT"; exit }
        }
        next
      }
      NR > start {
        if (index($0, "\"version\"") > 0) {
          n = split($0, q, "\"");
          if (n >= 4 && q[4] == want) { print "HIT"; exit }
        }
        # adjust depth; when object closes (d<=0), stop
        for (i=1; i<=length($0); i++) {
          c = substr($0,i,1);
          if (c == "{") d++
          else if (c == "}") d--
        }
        if (d <= 0) { exit }
      }
    ' "$lockfile"
  fi
}

# --- yarn.lock (classic & berry basic) ---
# We detect a header line containing "<pkg>@" (non-indented),
# then in the following indented lines look for:  version "X"
check_yarn_lock() {
  local lockfile="$1" pkg="$2" want="$3"
  awk -v pkg="$pkg" -v want="$want" '
    BEGIN { inblk=0 }
    # blank line ends a block
    /^[ \t]*$/ { inblk=0; next }
    # header: non-indented (start of block)
    /^[^ \t]/ {
      inblk = (index($0, pkg "@") > 0) ? 1 : 0
      next
    }
    # inside block: look for version "..."
    inblk {
      # require the word version followed by quote; then extract quoted value
      if (index($0, "version") > 0 && index($0, "\"") > 0) {
        n = split($0, q, "\"");
        # look for pattern: ... version "X" (=> q[2] == version, q[3] == X)
        # since spacing varies, we just take first quoted string after the word version
        # scan for the first quoted string after the word version:
        posV = index($0, "version")
        # find the first quote after posV
        # crude but effective: walk through quoted strings and choose the first after posV
        idx = 0
        off = 0
        best = ""
        # split already done; q[2k] are keys, q[2k+1] are quoted values
        # The actual value should be q[2] (key "version"), q[3] (value)
        # but to be robust, pick q[3] when q[2] == "version"
        if (q[2] == "version" && length(q) >= 3) {
          val = q[3]
          if (val == want) { print "HIT"; exit }
        }
      }
    }
  ' "$lockfile"
}

# --- pnpm-lock.yaml: look for exact "/<pkg>@<ver>:" ---
check_pnpm_lock() {
  local lockfile="$1" pkg="$2" want="$3"
  if LC_ALL=C grep -Fq "/$pkg@$want:" "$lockfile"; then
    echo "HIT"
  fi
}

# --- main loop ---
for entry in "${CHECKS[@]}"; do
  pkg="${entry%@*}"
  ver="${entry##*@}"

  echo
  echo "--- Checking lockfiles for '${pkg}', compromised version is '${ver}' ---"
  found_any=0

  # find lockfiles under ROOT, prune heavy/irrelevant macOS + build dirs
  while IFS= read -r -d '' lf; do
    case "$lf" in
      */package-lock.json|*/npm-shrinkwrap.json)
        if [[ "$(check_package_lock "$lf" "$pkg" "$ver")" == "HIT" ]]; then
          echo "🚨 VULNERABLE (npm lock): $pkg@$ver in: $lf"
          found_any=1
        fi
        ;;
      */yarn.lock)
        if [[ "$(check_yarn_lock "$lf" "$pkg" "$ver")" == "HIT" ]]; then
          echo "🚨 VULNERABLE (yarn lock): $pkg@$ver in: $lf"
          found_any=1
        fi
        ;;
      */pnpm-lock.yaml)
        if [[ "$(check_pnpm_lock "$lf" "$pkg" "$ver")" == "HIT" ]]; then
          echo "🚨 VULNERABLE (pnpm lock): $pkg@$ver in: $lf"
          found_any=1
        fi
        ;;
    esac
  done < <(
    find "$ROOT" -xdev \
      \( \
        -path "$HOME/Library/*" -o \
        -path "$HOME/Applications/*" -o \
        -path "$HOME/Music/*" -o \
        -path "$HOME/Movies/*" -o \
        -path "$HOME/Pictures/*" -o \
        -path "$HOME/Library/CloudStorage/*" -o \
        -path "$HOME/Dropbox/*" -o \
        -path "$HOME/OneDrive/*" -o \
        -path "*/.git" -o \
        -path "*/node_modules" -o \
        -path "*/dist" -o \
        -path "*/build" -o \
        -path "*/.cache" -o \
        -path "*/.venv" -o \
        -path "*/.next" -o \
        -path "*/coverage" \
      \) -prune \
      -o -type f \( \
        -name "package-lock.json" -o \
        -name "npm-shrinkwrap.json" -o \
        -name "yarn.lock" -o \
        -name "pnpm-lock.yaml" \
      \) -print0
  )

  (( found_any == 0 )) && echo "✅ No matching versions in lockfiles."
done
