let
  caiog_rua = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIH37w2lexSmPy2NSZA0Jd4rUHXk8HczZZEnn7ujwYoAm caiog@nixrua";
  caiog_casa = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPOxmOvetTQ2QeVkgQJOJaM6gTi54oJJXmP5pipNhGKs caiog@nixcasa";
  server_hsamg = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIP3HT8wab/txVA5Gy4xO3NAclEqb/IGrjPZf3QRcC2Oy caiog@hsamg";

  users = [ caiog_rua caiog_casa server_hsamg ];
in {
  "lastfm.age".publicKeys = users;
  "hsamg_pessoal_path.age".publicKeys = users;
  "hdesk_pessoal_path.age".publicKeys = users;
}
