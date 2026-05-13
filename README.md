# ❄️ nix-dots
  
![NixOS](https://img.shields.io/badge/NixOS-2a2630.svg?style=flat&logo=nixos&logoColor=%23CAD3F5)
![nixpkgs](https://img.shields.io/badge/nixpkgs-unstable-informational?style=flat&logo=nixos&logoColor=%23CAD3F5&labelColor=%232a2630&color=%2346397f)
![nix-darwin](https://img.shields.io/badge/nix--darwin-2a2630?style=flat&logo=apple)
![Niri](https://img.shields.io/badge/Niri-2a2630?style=flat&logo=niri&logoColor=D55C44)

## Installation
<details open>
  <summary><strong>NixOS</strong></summary>
  
```sh
nix run nixpkgs#git -- clone https://github.com/kaan-w/nix-dots.git
sudo nixos-rebuild switch --flake ./nix-dots
```
</details>
<details open>
  <summary><strong>Darwin</strong></summary>
  
```sh
curl -fsSL https://install.determinate.systems/nix | sh -s -- install --prefer-upstream-nix
xcode-select --install
softwareupdate --install-rosetta --agree-to-license
git clone https://github.com/kaan-w/nix-dots.git
sudo nix run nix-darwin/master#darwin-rebuild -- switch --flake ./nix-dots
```
</details>

## Templates

```
nix flake init -t github:kaan-w/nix-dots#<name>
```

<table>
  <tr>
    <th align="left">rust</th>
    <th align="left">zig</th>
    <th align="left">typst</th>
  <tr>
  <td valign="top">
    <pre>
├── src
│   └── main.rs
├── .envrc
├── .gitignore
├── Cargo.toml
├── flake.nix
└── rust-toolchain.toml</pre>
  </td>
  <td valign="top">
    <pre>
├── src
│   └── main.zig
├── .envrc
├── .gitignore
├── build.zig
├── build.zig.zon
└── flake.nix</pre>
  </td>
  <td valign="top">
    <pre>
├── .envrc
├── flake.nix
└── main.typ</pre>
  </td>
</table>

## Packages
<details>
  <summary><strong>obsidian plugins</strong></summary>
  
- `obsidian-calendar`
- `obsidian-codeblock-customizer`
- `obsidian-git`
- `obsidian-iconic`
- `obsidian-iconize`
- `obsidian-minimal-settings`
- `obsidian-minimal-theme`
- `obsidian-no-more-flickering-inline-math`
- `obsidian-periodic-notes`
- `obsidian-tag-wrangler`
- `obsidian-typst-mate`
</details>
<details>
  <summary><strong>vscode extensions</strong></summary>
  
- `vscode-gutter-preview`
- `vscode-moegi-theme`
</details>
