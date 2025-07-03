FROM python:3.12.3-alpine3.18

# Define o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copia o arquivo de requisitos e instala as dependências
# Usamos --no-cache-dir para evitar o cahe do pip, reduzindo o tamanho da imagem
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copia o restante do código da aplicação para o diretório de trabalho
COPY . . 

# Expõe a porta que a aplicação FastAPI irá rodas (padrão é 8000)
EXPOSE 8000

# Comando para rodar a aplicação usando uvicorn
# O host 0.0.0.0 permite que a aplicação seja acessível externnamente ao contêner
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000","--reload"]

