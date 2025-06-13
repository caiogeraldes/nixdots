{
  age = {
    identityPaths = [ "/home/caiog/.ssh/id_ed25519" ];
    secrets = {
      lastfm = {
        file = ../secrets/lastfm.age;
        owner = "caiog";
      };
      hsamg_pessoal_path = {
        file = ../secrets/hsamg_pessoal_path.age;
        owner = "caiog";
      };
      hdesk_pessoal_path = {
        file = ../secrets/hdesk_pessoal_path.age;
        owner = "caiog";
      };
    };
  };
}
