let
  # Import pinned inputs.
  system = "x86_64-linux";
  sources = import ./nix/tamal { inherit system; };

  # Import Nilla.
  nilla = import sources.nilla;
in
# Create our Nilla project.
nilla.create {
  config = {
    inputs.nixpkgs.src = sources.nixpkgs;

    shells.default = {
      # Declare what systems the shell can be used on.
      systems = [ system ];

      # Define our shell environment.
      shell =
        { mkShell, pixi, ... }:
        mkShell {
          packages = [
            pixi
          ];
        };
    };
  };
}
