# 1Negócios - Site de Captura de Leads

## Descrição
Este é um site de captura de leads para a 1Negócios, projetado para coletar informações de potenciais clientes interessados em oportunidades de investimento imobiliário. O site inclui formulários de inscrição, integração com webhook para automação e otimização para SEO e performance.

## Funcionalidades
- Formulário de captura de leads com validação
- Integração com n8n para automação de workflows
- Otimização SEO com robots.txt e sitemap.xml
- Design responsivo e otimizado para mobile
- Envio de e-mails automáticos via webhook

## Pré-requisitos
- Node.js v18 ou superior
- Docker (opcional para deploy)
- Conta no GitHub para deploy

## Instruções de Instalação
1. Clone o repositório: `git clone https://github.com/quadradois/nnegocios-landing.git`
2. Instale as dependências: `npm install`
3. Configure as variáveis de ambiente: Copie `.env.example` para `.env` e preencha os valores

## Instruções de Execução
- Desenvolvimento: `npm run dev`
- Produção: `npm run build` seguido de `npm start`
- Com Docker: `docker-compose up -d`

## Estrutura do Projeto
- `assets/`: Arquivos estáticos (CSS, JS, imagens)
- `workflows/`: Workflows do n8n
- `Dockerfile`: Configuração Docker para o site
- `Dockerfile.n8n`: Configuração Docker para n8n
- `.htaccess` e `nginx.conf`: Configurações de servidor

## Configuração
- Edite `.env` para configurar porta, webhook, e-mail, etc.
- Para SEO, atualize `robots.txt` e `sitemap.xml`

## Contato
Para suporte, entre em contato via e-mail: support@1negocios.com

## Opções de Deploy
- Hospedagem compartilhada com Apache/Nginx
- Deploy em Vercel ou Netlify para static sites
- Docker para ambientes containerizados

## Troubleshooting
- Erro de porta: Verifique se a porta configurada em `.env` está livre
- Problemas com webhook: Teste a integração com n8n
- Otimização: Consulte `OPTIMIZACOES.md` para dicas de performance

## Licença
MIT License - Veja o arquivo LICENSE para detalhes.