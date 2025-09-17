{ pkgs, ... }:

{
  # https://devenv.sh/packages/
  packages = with pkgs; [
    git
    checkmake
    mdformat
    nixfmt-classic
    powershell
    rubocop
  ];

  # https://devenv.sh/languages/
  languages.ansible.enable = true;

  # https://devenv.sh/tasks/
  tasks = {
    "lint:run".exec = ''
      ansible-lint -c .ansible-lint
      checkmake Makefile
      mdformat README.md
      nixfmt devenv.nix
      pwsh -Command "Install-Module -Name PSScriptAnalyzer -Force"
      pwsh -Command "Invoke-ScriptAnalyzer -Path scripts/ -Recurse"
      rubocop -A Vagrantfile'';
  };

  enterTest = ''
    make help
  '';

  # https://devenv.sh/git-hooks/
  git-hooks.hooks = {
    ansible-lint.enable = true;
    checkmake.enable = true;
    mdformat.enable = true;
    nixfmt-classic.enable = true;
    trim-trailing-whitespace.enable = true;
    trufflehog.enable = true;
  };

  # See full reference at https://devenv.sh/reference/options/
}
