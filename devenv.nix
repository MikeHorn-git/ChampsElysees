{ pkgs, ... }:

{
  # https://devenv.sh/packages/
  packages = with pkgs; [
    git
    ansible-lint
    checkmake
    mdformat
    nixfmt-classic
    rubocop
    vagrant
  ];

  # https://devenv.sh/languages/
  languages.ansible.enable = true;

  # https://devenv.sh/tasks/
  tasks = {
    "lint:run".exec = ''
      ansible-lint -c .ansible-lint
       git ls-files --cached --others --exclude-standard 'Makefile' | xargs checkmake
       mdformat README.md
       git ls-files --cached --others --exclude-standard '*.nix' | xargs nixfmt
       rubocop -A Vagrantfile'';
    "reqs:run".exec = ''
      vagrant plugin install vagrant-vbguest
       vagrant plugin install winrm
       vagrant plugin install winrm-elevated
       vagrant plugin install winrm-fs'';
  };

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
