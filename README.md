## Quick Setup on a New Machine

### 1. Install Nix (multi-user installation)

```bash
  sh <(curl --proto '=https' --tlsv1.2 -L [https://nixos.org/nix/install](https://nixos.org/nix/install)) -- --daemon

```
### 2. Close and reopen your terminal

### 3. Clone *this* repository and cd into it

### 4. First time activation

```bash
  nix run github:nix-community/home-manager -- switch --flake .#ktsirangelos
```
