{ nixops ? <nixops> , nixpkgs ? <nixpkgs> }:

let
  lib = import "${nixpkgs}/lib";

  inherit (import "${nixops}/nix/eval-machine-info.nix" {
    networkExprs = [ ./deploy.nix ]; # Replace this to with your own network
                                  # expression file
    uuid = "dummy";
    deploymentName = "dummy";
    args = [];
  }) nodes;

in lib.mapAttrs (lib.const (n: n.config.system.build.toplevel)) nodes
