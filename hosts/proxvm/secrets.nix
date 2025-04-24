{
  age = {
    secrets = {
      vars = {
        file = ../../secrets/vars.age;
      };
      gzapf-secrets = {
        file = ../../secrets/gzapf-secrets.age;
        owner = "gzapf";
        group = "gzapf";
        mode = "0400";
        path = "/home/gzapf/.secrets";
      };
      wireguard-config = {
        file = ../../secrets/wireguard-config.age;
        owner = "gzapf";
        group = "gzapf";
        mode = "0400";
        path = "/etc/wireguard/wireguard-config.conf";
      };

    };
  };
}
