#!/bin/bash
set -e

echo "🚀 Starting deployment..."

# Install Node if missing
if ! command -v node >/dev/null 2>&1; then
  curl -fsSL https://rpm.nodesource.com/setup_18.x | sudo bash -
  sudo yum install -y nodejs git
  sudo npm install -g pm2
fi

cd /home/ec2-user

if [ ! -d "aws-cloud-native-ecommerce-platform" ]; then
  git clone https://github.com/josephmj0303/aws-cloud-native-ecommerce-platform.git
fi

cd aws-cloud-native-ecommerce-platform
git pull origin main

# -------- API --------
cd ebook-backend-api
npm install
pm2 delete api || true

PORT=8080 \
DB_HOST=$DB_HOST \
DB_NAME=$DB_NAME \
DB_USER=$DB_USER \
DB_PASSWORD=$DB_PASSWORD \
pm2 start src/server.js --name api

# -------- ADMIN --------
cd ../ebook-admin-be
npm install
pm2 delete admin || true

PORT=8081 \
DB_HOST=$DB_HOST \
DB_NAME=$DB_NAME \
DB_USER=$DB_USER \
DB_PASSWORD=$DB_PASSWORD \
pm2 start app.js --name admin

pm2 save

echo "✅ Deployment completed"
