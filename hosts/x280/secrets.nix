{
  age = {
    secrets = {
      vars = {
        file = ../../secrets/vars.age;
      };
      # $username-secrets.age for environment variables that are sourced to fish
      gzapf-secrets = {
        file = ../../secrets/gzapf-secrets.age;
        owner = "gzapf";
        group = "users";
        mode = "400";
        path = "/home/gzapf/.secrets";
      };
      wireguard-config = {
        file = ../../secrets/wireguard-config.age;
        owner = "gzapf";
        group = "users";
        mode = "0400";
        path = "/etc/wireguard/wireguard-config1.conf";
      };
      nginx-container = {
        file = ../../secrets/nginx-container.age;
      };
    };
  };
}
