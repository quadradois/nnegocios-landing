FROM node:18-alpine

WORKDIR /usr/src/app

# Instalar http-server globalmente
RUN npm install -g http-server

# Copiar package.json e package-lock.json
COPY package*.json ./

# Copiar o código fonte
COPY . .

# Expor a porta
EXPOSE 5500

# Comando para iniciar o servidor
CMD ["npm", "run", "web"]
