let
  proxvm = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBL8bS4xBam5/SN6cN5kKf/Q5j+LpR20sOnM6wpb6WJT";
  gzapf = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFatzRUQRrEQ2MRPhhHNNEBbK4zWlwK4LL9SqvwXiJRu";
in
{
  "vars.age".publicKeys = [ proxvm gzapf ];
  "gzapf-secrets.age".publicKeys = [ proxvm gzapf ];
  "wireguard-config.age".publicKeys = [ proxvm gzapf ];
  "nginx-container.age".publicKeys = [ proxvm gzapf ];
}
