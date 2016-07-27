#! /bin/bash
sudo find -iname __pycache__ -exec rm -vrf {} \;
sudo find -iname "*.pyc" -exec rm -vrf {} \;
zip -r "../$1.zip" *
echo "#! /usr/bin/env python" | cat - "../$1.zip" > "../$1"
rm "../$1.zip"
chmod +x "../$1"
