

# ⚠️ Atenção!
Ao instalar os **Codecs de multimídia**, será necessário confirmar uma ação durante o processo. Use a tecla **TAB** para navegar até a opção correta e pressione **ENTER** para prosseguir.

---

## 🟢 Scripts Disponíveis

### 1. `Meu-Ubuntu-config-pessoal.sh`
Script pessoal para configuração do Ubuntu Desktop, focado em ajustes e personalizações do sistema.

---

### 2. `Meu-Fedora43-config-pessoal.sh`
Script para configurar um sistema Fedora 43 otimizado para jogos e para remover swap com segurança.

**Uso rápido:**

```bash
sudo bash Meu-Fedora43-config-pessoal.sh
```

Opções disponíveis:
- `--yes` ou `-y`: assume "sim" para todas as confirmações (não interativo)
- `--no-reboot`: não reinicia automaticamente ao final

Resumo do que o script realiza: habilitação do RPM Fusion e Flathub, instalação de Steam/Lutris/Wine/vulkan/mangohud/gamemode, detecção de GPU (e instalação de drivers) e remoção segura de swap (backup do `/etc/fstab` antes de alterações).

## 🟢 Como Executar os Scripts

1. Faça o download do arquivo `.zip` deste repositório.
2. Extraia o conteúdo em um diretório de sua preferência.
3. Abra a pasta extraída, clique com o botão direito em um espaço vazio e selecione **"Abrir terminal aqui"**.
4. No terminal, torne o script executável (caso necessário):
	```bash
	chmod +x Meu_Ubuntu_posinstall.sh Meu-Ubuntu-config-pessoal.sh
	```
5. Execute o script desejado:
	```bash
	./Meu-Ubuntu-config-pessoal.sh
	```
6. Siga as instruções exibidas no terminal. Será solicitada a senha do usuário para continuar; digite-a e pressione **ENTER**.
7. Selecione a opção desejada para execução.

---

## 🟢 Observações Importantes
- Os scripts utilizam **PPAs** (Personal Package Archives). Execute por sua conta e risco.
- Recomenda-se ler o código antes de executar para entender as alterações realizadas no sistema.
- Sempre faça backup dos seus dados antes de executar scripts de automação.

---

## 🟢 Suporte e Contato
- 🌎 Blog: [edylimatutoriais.blogspot.com](https://edylimatutoriais.blogspot.com/)
- Dúvidas ou sugestões? Entre em contato pelo blog ou abra uma issue neste repositório.





