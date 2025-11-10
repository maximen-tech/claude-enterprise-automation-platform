# 🚀 Quick Start Guide

## Installation (5 minutes)

### Prérequis

- Docker 24+
- 8GB RAM minimum
- 50GB disque
- Compte Anthropic API

### Étapes

```bash
# 1. Clone
git clone https://github.com/maximen-tech/claude-enterprise-automation-platform.git
cd claude-enterprise-automation-platform

# 2. Configuration
cp .env.example .env
# Éditer .env:
# - ANTHROPIC_API_KEY=sk-ant-...
# - POSTGRES_PASSWORD=...
# - N8N_ENCRYPTION_KEY=...

# 3. Installation
./scripts/setup.sh

# 4. Lancement
docker-compose up -d
```

### Accès Services

| Service | URL | Credentials |
|---------|-----|-------------|
| Dashboard | http://localhost:3000 | - |
| n8n | http://localhost:5678 | Voir .env |
| API | http://localhost:8000 | - |
| Grafana | http://localhost:3001 | admin/admin |

## Premier Use Case

### 1. Analyse d'Entreprise

```bash
python orchestrator/analyze_company.py slack.com
```

**Output:** Rapport 200+ pages en 45 min

### 2. Développement Quantum

```bash
# Dans Claude Desktop
# Charger: .quantum/prompts/P2_FEATURE_ADD.xml

# Spécifier:
# - Feature name
# - Priority
# - Complexity
```

**Output:** Feature complète -80% tokens

### 3. Workflow Automation

```bash
# Accéder n8n
open http://localhost:5678

# Importer workflow
# workflows/service-client.json

# Activer et tester
```

## Troubleshooting

### Docker ne démarre pas

```bash
docker-compose logs
docker-compose down
docker-compose up -d --force-recreate
```

### PostgreSQL erreur

```bash
docker volume rm claude-platform_postgres_data
docker-compose up -d
```

### Ollama lent

```bash
# Vérifier GPU
nvidia-smi

# Ou forcer CPU
docker-compose --profile cpu up -d
```

## Next Steps

1. Lire [ARCHITECTURE.md](ARCHITECTURE.md)
2. Explorer [skills/](skills/)
3. Tester [templates/](templates/)
4. Consulter [docs/](docs/)

**Support:** support@claude-automation.com
