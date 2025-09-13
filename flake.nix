{
	description = "muserve";

	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

		# provide flakes for multiple architectures
		flake-utils.url = "github:numtide/flake-utils";
	};

	outputs = { self, nixpkgs, flake-utils }:
		(flake-utils.lib.eachDefaultSystem (system:
			let pkgs = import nixpkgs { inherit system; };
			in {
				devShells.default = pkgs.mkShell {
					buildInputs = with pkgs.python313Packages; [
						grip
					];
				};
			}
		));
}
