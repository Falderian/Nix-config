cp /etc/nixos/configuration.nix .
cp /etc/nixos/common.nix .

konsave -s purple
konsave -e purple

git add .
git commit -m "update"
git push origin

rm purple.knsv
