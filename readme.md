# Duxpe's NixOS Configuration with Hyprland

🎉 **Bem-vindo à configuração do Duxpe para NixOS utilizando Hyprland!** Este repositório contém todos os arquivos de configuração necessários para configurar seu ambiente NixOS com Hyprland, Wayland e várias ferramentas úteis.

## 📁 Estrutura do Projeto

```
.
├── dotfiles
│   ├── hypr
│   │   ├── conf
│   │   └── hyprland.conf
│   ├── dunst
│   │   └── dunstrc
│   ├── rofi
│   │   └── config.rasi
│   └── ml4w
│       ├── scripts
│       └── settings
├── modules
│   ├── system
│   │   ├── package.nix
│   │   ├── network.nix
│   │   ├── locale.nix
│   │   ├── users.nix
│   │   ├── greetd.nix
│   │   └── hyprland.nix
│   └── hardware-configuration.nix
├── flake.nix
└── flake.lock
```

## 🚀 Instalação e Configuração

1. **Habilite Flakes e Home-Manager**

    Antes de começar, é necessário habilitar os flakes e o home-manager no seu sistema NixOS. Adicione as seguintes linhas ao seu arquivo de configuração `/etc/nixos/configuration.nix`:

    ```nix
    {
      nix = {
        package = pkgs.nixFlakes;
        extraOptions = ''
          experimental-features = nix-command flakes
        '';
      };
    }
    ```

    E para habilitar o home-manager, adicione:

    ```nix
    {
      imports = [
        <home-manager/nixos>
      ];
    }
    ```

    Em seguida, aplique as mudanças:

    ```sh
    sudo nixos-rebuild switch
    ```

2. **Clone o Repositório**

    ```sh
    git clone https://github.com/duxpe/nixos-hyprland-config.git
    cd nixos-hyprland-config
    ```

3. **Copie os Dotfiles**

    Copie manualmente os arquivos de configuração para o diretório `~/.config`:

    ```sh
    cp -r dotfiles/* ~/.config/
    ```

4. **Configure o NixOS**

    Edite o arquivo `flake.nix` e ajuste conforme necessário. Em seguida, execute os seguintes comandos para aplicar as configurações:

    ```sh
    sudo nixos-rebuild switch --flake .#duxpe
    ```

5. **Reinicie o Sistema**

    Reinicie o sistema para garantir que todas as configurações entrem em vigor:

    ```sh
    sudo reboot
    ```

## 🛠️ Ferramentas e Utilitários

- **Hyprland**: Gerenciador de janelas para Wayland
- **Waybar**: Barra de status para Wayland
- **Dunst**: Daemon de notificações
- **Rofi**: Lançador de aplicativos
- **Thunar**: Gerenciador de arquivos
- **NetworkManager**: Gerenciamento de rede
- **nm-applet**: Applet para NetworkManager
- **nmdmenu**: Interface gráfica para NetworkManager
- **Gnome Keyring**: Gerenciamento de chaves SSH

## 📜 Licença

Este projeto está licenciado sob a... na real, não está licenciado não hehe...

---

Feito com ❤️ por Duxpe. Aproveite a configuração NixOS com Hyprland! 🚀

