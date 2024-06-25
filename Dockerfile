# ubuntuの公式イメージをベースにする
FROM ubuntu

# 必要なパッケージのインストール
# RUN apk add --no-cache git

# nodejsとnpmのインストール
RUN apt update && \
    apt install -y nodejs npm

# Vue CLIのインストール
RUN npm install -g @vue/cli

# 作業ディレクトリの設定
WORKDIR /app

# ホストのpackage.jsonをコンテナにコピー
COPY package*.json ./

# 依存パッケージのインストール
RUN npm install

# ポートの設定
EXPOSE 8080

# 開発サーバの起動
CMD ["npm", "run", "serve"]