let
  caiog_rua = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIH37w2lexSmPy2NSZA0Jd4rUHXk8HczZZEnn7ujwYoAm caiog@nixrua";
  caiog_casa = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPOxmOvetTQ2QeVkgQJOJaM6gTi54oJJXmP5pipNhGKs caiog@nixcasa";
  server_hsamg = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBGDQ/EazeI4O8b8Z7aXFiygcCasTv7E7ym4kAH7E3Yb caiog@hsamg";

  users = [ caiog_rua caiog_casa server_hsamg ];
in {
  "lastfm.age".publicKeys = users;
}
