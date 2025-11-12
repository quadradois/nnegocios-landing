#!/bin/bash

echo "🔍 Diagnóstico de Imagens - NNegócios"
echo "====================================="

echo ""
echo "📂 Verificando estrutura de arquivos:"
echo "--------------------------------------"
ls -la assets/images/ | head -10

echo ""
echo "🖼️ Testando acessibilidade das imagens:"
echo "--------------------------------------"
echo "WebP hero-bg-1:"
curl -I http://localhost/assets/images/hero-bg-1.webp 2>/dev/null | head -1

echo "PNG hero-bg-1 (fallback):"
curl -I http://localhost/assets/images/hero-bg-1.png 2>/dev/null | head -1

echo "WebP logo:"
curl -I http://localhost/assets/images/logo.webp 2>/dev/null | head -1

echo ""
echo "📄 Verificando CSS inline no HTML:"
echo "--------------------------------------"
curl -s http://localhost | grep -A3 "hero__bg.*background-image"

echo ""
echo "📄 Verificando CSS externo:"
echo "--------------------------------------" 
curl -s http://localhost/assets/css/styles.css | grep -A3 "hero__bg.*background-image"

echo ""
echo "🌐 Testando JavaScript de detecção WebP:"
echo "--------------------------------------"
curl -s http://localhost/assets/js/performance.js | grep -A5 "supportsWebP"

echo ""
echo "✅ Status final:"
echo "--------------------------------------"
echo "Container web status:"
docker compose ps web

echo ""
echo "Nginx status:"
systemctl is-active nginx

echo ""
echo "🔧 Para testar no browser:"
echo "- Acesse: http://localhost"
echo "- Abra DevTools (F12) > Network"
echo "- Recarregue a página (Ctrl+F5)"
echo "- Veja se hero-bg-1.webp está carregando"