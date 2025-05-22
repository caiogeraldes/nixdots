{
  age = {
    identityPaths = [ "/home/caiog/.ssh/id_ed25519" ];
    secrets = {
      lastfm = {
        file = ../secrets/lastfm.age;
        owner = "caiog";
      };
    };
  };
}
