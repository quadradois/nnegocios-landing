# 1Negócios Landing Page

Landing page responsiva para captação de leads, com foco em conversão segura e integração direta aos canais de atendimento da 1Negócios.

## ✨ Destaques

- **UX focada em conversão**: CTA múltiplo (WhatsApp, Calendly, e-mail) com cards em glassmorphism.
- **Visual moderno**: Hero parallax, animação leve de rede neural e mockup do e-book.
- **SEO preparado**: Metatags, Schema.org (Organization, WebPage, FAQ, Book) e assets otimizados.
- **Hardening**: Links externos com `rel="noopener"`, remoção de armazenamento local de dados e sem scripts invasivos.

## 📦 Stack

- HTML + CSS + JS vanilla (sem frameworks).
- Servido por Nginx dentro de contêiner Docker (`docker-compose.yml`).
- Serviços auxiliares previstos: n8n.

## 🧪 Desenvolvimento Local

```bash
git clone https://github.com/quadradois/nnegocios-landing.git
cd nnegocios-landing
npm install
npm run web   # Servidor local em http://localhost:5500
```

## 🚀 Deploy Automatizado (Ubuntu 24.04 “virgem”)

Use o script `deploy.sh` para provisionar Docker e subir toda a stack.

```bash
sudo apt-get update
sudo apt-get install -y git
git clone https://github.com/quadradois/nnegocios-landing.git
cd nnegocios-landing
chmod +x deploy.sh
sudo ./deploy.sh
```

O script executa:

- Instalação/atualização do Docker Engine + plugin `docker compose`.
- Inclusão automática do usuário no grupo `docker` (quando aplicável).
- `docker compose pull` seguido de `docker compose up -d --remove-orphans`.
- Exibe `docker compose ps` ao final para verificação rápida.

> Após ser adicionado ao grupo `docker`, faça **logout/login** para usar Docker sem `sudo`.

## 🗂️ Estrutura

```text
.
├── assets/
│   ├── css/
│   ├── images/
│   └── js/
├── workflows/
├── deploy.sh
├── docker-compose.yml
├── Dockerfile
├── Dockerfile.n8n
├── nginx.conf
├── index.html
├── package.json
└── README.md
```

## 🛠️ Pós-deploy

- **Atualizar serviços**: `sudo ./deploy.sh` (reaplica pull + up).
- **Logs**: `docker compose logs -f <serviço>`.
- **Parar stack**: `docker compose down`.

## ❗ Troubleshooting

- **Sem permissão no Docker**: garanta que o usuário esteja no grupo `docker` e inicie nova sessão.
- **Assets quebrados**: confirme que a pasta `assets/` foi copiada e servida pelo Nginx do container `web`.

## 📄 Licença

Licença ISC.

---

Feito com ❤️ pela 1Negócios.
