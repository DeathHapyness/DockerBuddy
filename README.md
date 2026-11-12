# DockerBuddy

Colinha de comandos Docker no terminal.

![meme](image_1.png)

## Instalar

Rode **de dentro da pasta do projeto** (o `$PWD` precisa ser a pasta do DockerBuddy, senão o link aponta pro lugar errado):

```bash
cd DockerBuddy
ln -sf "$PWD/dockerbuddy.sh" ~/.local/bin/dockerbuddy
```

### NixOS

O NixOS não tem `/bin/bash`, então o link acima não funciona lá. Use o `default.nix`, que adapta o shebang sem mexer no script:

```bash
cd DockerBuddy
nix-env -f . -i          # instala no perfil do usuário
# ou, só para testar:
nix-build && ./result/bin/dockerbuddy
```

## Usar

```bash
dockerbuddy
```

Escolhe um número e pronto.

## Editar

Os comandos ficam em `data/*.txt`.
