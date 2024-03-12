#!/bin/sh

cp ./styles.css ./target/styles.css
cp Open-Ink-Logo.png ./target/Open-Ink-Logo.png
cp Open-Ink-Favicon.png ./target/Open-Ink-Favicon.png
cp -r ./favicon.png ./target/favicon.png


sed -i '.bak' 's|dbt Docs|Open Ink Voter Integrity Analysis|' target/index.html
sed -i '.bak' 's|</head>|<link rel="stylesheet" href="/voter-integrity-analysis/styles.css"/>\r\n</head>|' target/index.html
sed -i -E 's|<link rel="shortcut icon" href=".*" />|<link rel="icon" type="image/png" href="voter-integrity-analysis/favicon.png">|' target/index.html