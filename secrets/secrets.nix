let
  caiog_rua = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIH37w2lexSmPy2NSZA0Jd4rUHXk8HczZZEnn7ujwYoAm caiog@nixrua";
  caiog_casa = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPOxmOvetTQ2QeVkgQJOJaM6gTi54oJJXmP5pipNhGKs caiog@nixcasa";

  users = [ caiog_rua caiog_casa ];
in {
  "lastfm.age".publicKeys = users;
}
