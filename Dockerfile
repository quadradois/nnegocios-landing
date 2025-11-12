FROM node:18-alpine

WORKDIR /usr/src/app

# Copiar package.json e package-lock.json
COPY package*.json ./

# Instalar dependências
RUN npm ci --only=production

# Copiar o código fonte
COPY . .

# Expor a porta
EXPOSE 5500

# Comando para iniciar o servidor
CMD ["npm", "run", "web"]
