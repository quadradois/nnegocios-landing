# 1Negócios - Site de Captura de Leads

Site de landing page com integração WhatsApp para captura e gestão de leads.

## 🚀 Funcionalidades

- **Landing Page Responsiva**: Design moderno e otimizado para conversão
- **Integração WhatsApp**: Botão direto para enviar mensagens via WhatsApp
- **Formulário de Contato**: Com validação e tracking de conversões
- **Design Moderno**: Interface limpa com gradientes e animações suaves

## 📋 Pré-requisitos

- Python 3.6+ (para servidor de desenvolvimento)

## 🛠️ Instalação

1. **Clone o repositório**:
   ```bash
   git clone <url-do-repositorio>
   cd 1negocios
   ```

2. **Configure as variáveis de ambiente** (se necessário):
   ```bash
   cp .env.example .env
   # Edite o arquivo .env com suas configurações
   ```

## 🚀 Como Executar

### Desenvolvimento Local

```bash
# Iniciar o site (porta 5500)
npm run web

# Ou usando Python diretamente
python -m http.server 5500
```

### Produção

Para deploy em produção, recomendamos:

1. **Site Estático**: Hospedar em Netlify, Vercel ou GitHub Pages
2. **Servidor Próprio**: Servir os arquivos estáticos via Apache/Nginx

## 📁 Estrutura do Projeto

```
1negocios/
├── assets/           # Arquivos estáticos
│   ├── css/         # Estilos CSS
│   ├── js/          # JavaScript customizado
│   └── images/       # Imagens e ícones
├── workflows/        # Pasta para workflows futuros
├── index.html        # Página principal
├── package.json      # Scripts de desenvolvimento
├── .env.example      # Variáveis de ambiente exemplo
├── .gitignore        # Arquivos ignorados pelo git
└── README.md         # Este arquivo
```

## ⚙️ Configuração

### Variáveis de Ambiente (Opcional)

Crie um arquivo `.env` baseado no `.env.example` para configurações personalizadas.

## 📞 Contato

- **WhatsApp**: (48) 99150-3001
- **Email**: contato@nnegocios.com.vc
- **Site**: [1Negócios](http://localhost:5500)

## 🔄 Deploy

### Opção 1: Netlify/Vercel (Site Estático)

1. Conecte seu repositório
2. Configure build command: vazio (apenas sirva os arquivos estáticos)
3. Set publish directory: `/` (raiz)

### Opção 2: Servidor Próprio

```bash
# Clone o repositório
git clone <repositorio>
cd 1negocios

# Sirva os arquivos estáticos
# Usando Python:
python -m http.server 5500

# Ou configure seu servidor web (Apache/Nginx) para servir a pasta
```

## 🐛 Troubleshooting

### Portas em Uso

```bash
# Verificar portas (Windows)
netstat -ano | findstr :5500

# Matar processo (Windows)
taskkill /PID <PID> /F
```

### Erros Comuns

- **Site não carrega**: Verifique se Python está instalado
- **Arquivos não encontrados**: Verifique se o servidor está na pasta correta

## 📄 Licença

Este projeto está sob licença ISC.

---

Desenvolvido com ❤️ pela 1Negócios