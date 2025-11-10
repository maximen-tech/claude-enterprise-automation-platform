#!/bin/bash
# Install script: setup everything for Claude Enterprise Automation Platform

set -e

echo "🔧 [Install] Démarrage installation plateforme..."

if ! command -v docker &> /dev/null; then
    echo "Docker doit être installé. Abandon."
    exit 1
fi

echo "✅ Docker trouvé."

cp .env.example .env

mkdir -p infrastructure/monitoring
mkdir -p infrastructure/backups
mkdir -p dashboard
mkdir -p api
mkdir -p skills
mkdir -p orchestrator
mkdir -p templates
mkdir -p docs
mkdir -p scripts
mkdir -p tests

# Copy sample Caddyfile
if [ ! -f ./infrastructure/Caddyfile ]; then
cat <<EOL > ./infrastructure/Caddyfile
:80 {
    respond "Hello Claude Automation Platform!"
}
EOL
fi

chmod +x scripts/setup.sh

echo "✅ Préparation complète. Vous pouvez lancer docker-compose maintenant."
