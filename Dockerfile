# Базовий образ 
FROM node:lts

# Робоча директорія всередині контейнера
WORKDIR /app

# Спочатку копіюємо тільки package.json
COPY package*.json ./

# Встановлюємо залежності
RUN npm install

# Копіюємо решту коду проєкту
COPY . .

# Відкриваємо порт застосунку
EXPOSE 3000

# Команда запуску
CMD ["node", "index.js"]
