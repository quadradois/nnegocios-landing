# 📋 NNegócios - Status do Deploy

## ✅ Deploy Completado com Sucesso!

### 🔧 Infraestrutura
- **Servidor**: Ubuntu 24.04.3 LTS (vmi2904681)
- **Docker**: Instalado e configurado
- **Nginx**: Configurado como proxy reverso
- **Firewall**: UFW ativo (portas 22, 80, 443)
- **SSL**: Certbot instalado (pronto para configurar)

### 🚀 Serviços Rodando

| Serviço | Container | Porta | Status | Acesso |
|---------|-----------|-------|--------|--------|
| **Site Principal** | 1negocios_web | 5500 | ✅ | http://servidor/ |
| **Evolution API** | evolution_api | 8080 | ✅ | http://servidor:8080 |
| **N8N Automation** | nnegocios-landing-n8n-1 | 5678 | ✅ | http://servidor:5678 |
| **PostgreSQL** | evolution_postgres | 5432 | ✅ | Internal |
| **Redis Cache** | evolution_redis | 6379 | ✅ | Internal |

### 🌐 Domínios Configurados (Nginx)
- **nnegocios.com.vc** → Site principal (porta 5500)
- **api.nnegocios.com.vc** → Evolution API (porta 8080)
- **n8n.nnegocios.com.vc** → N8N (porta 5678)

## 📝 Próximos Passos

### 1. Configurar SSL/HTTPS
Para habilitar HTTPS com certificado Let's Encrypt:

```bash
# Configurar DNS primeiro (apontar domínio para este servidor)
# Depois executar:
sudo certbot --nginx -d nnegocios.com.vc -d www.nnegocios.com.vc

# Para subdomínios (opcional):
sudo certbot --nginx -d api.nnegocios.com.vc
sudo certbot --nginx -d n8n.nnegocios.com.vc
```

### 2. Comandos Úteis

#### Gerenciar Containers
```bash
cd /root/nnegocios-landing

# Ver status dos containers
docker compose ps

# Reiniciar todos os serviços
docker compose restart

# Parar todos os serviços
docker compose down

# Atualizar e reiniciar (pull novas imagens)
docker compose pull && docker compose up -d

# Ver logs de um serviço específico
docker compose logs -f web
docker compose logs -f evolution-api
docker compose logs -f n8n
```

#### Gerenciar Nginx
```bash
# Testar configuração
sudo nginx -t

# Recarregar configuração
sudo systemctl reload nginx

# Reiniciar nginx
sudo systemctl restart nginx

# Ver logs do nginx
sudo tail -f /var/log/nginx/access.log
sudo tail -f /var/log/nginx/error.log
```

### 3. Firewall (UFW)
```bash
# Ver status
sudo ufw status

# Adicionar nova regra (exemplo)
sudo ufw allow from 192.168.1.0/24 to any port 8080
```

### 4. Backup e Manutenção

#### Backup dos dados
```bash
# Backup dos volumes do Docker
docker compose down
sudo tar -czf /backup/nnegocios-$(date +%Y%m%d).tar.gz \
  /var/lib/docker/volumes/nnegocios-landing_*

# Backup da configuração do nginx
sudo cp -r /etc/nginx/sites-available/nnegocios /backup/
```

#### Renovação SSL (automática)
```bash
# Testar renovação
sudo certbot renew --dry-run

# O certbot.timer já está configurado para renovação automática
sudo systemctl status certbot.timer
```

## 🔧 Configurações Específicas

### Arquivo .env
Localização: `/root/nnegocios-landing/.env`

Principais variáveis configuradas:
- `PORT=5500` (porta do site)
- `NODE_ENV=production`
- `DATABASE_CONNECTION_URI` (PostgreSQL)
- `CACHE_REDIS_URI` (Redis)
- `N8N_PORT=5678`
- `AUTHENTICATION_API_KEY` (Evolution API)

### Portas Abertas
- **22**: SSH
- **80**: HTTP (nginx proxy)
- **443**: HTTPS (nginx proxy)
- **5500**: Site principal (container)
- **5678**: N8N (container)
- **8080**: Evolution API (container)

## 🚨 Troubleshooting

### Container não inicia
```bash
# Verificar logs
docker compose logs [serviço]

# Reiniciar serviço específico
docker compose restart [serviço]
```

### Site não carrega
```bash
# Verificar nginx
sudo systemctl status nginx
sudo nginx -t

# Verificar container web
docker compose logs web
curl -I http://localhost:5500
```

### Problemas de SSL
```bash
# Verificar certificados
sudo certbot certificates

# Renovar manualmente
sudo certbot renew --force-renewal
```

---

## 📞 Suporte
- **Logs nginx**: `/var/log/nginx/`
- **Configuração nginx**: `/etc/nginx/sites-available/nnegocios`
- **Projeto**: `/root/nnegocios-landing/`

**Deploy realizado em**: $(date)
**Status**: ✅ Operacional