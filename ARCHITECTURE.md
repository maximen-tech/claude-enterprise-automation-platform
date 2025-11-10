# 🏗️ Architecture Complète

## Vue d'ensemble

```
┌───────────────────────────────────┐
│     Users / API Clients          │
└───────────────┬───────────────────┘
                │
        ┌───────▼───────┐
        │  Caddy (SSL)   │
        └─────┬────┬────┘
             │    │
     ┌───────▼────▼───────┐
     │ Dashboard  API     │
     │ (Next.js) (FastAPI)│
     └──────┬───────┬─────┘
            │       │
    ┌───────▼───────▼──────┐
    │   Orchestrator      │
    │   - Skill Manager   │
    │   - Workflow Engine │
    └───┬──────┬──────┬───┘
        │      │      │
   ┌────▼── ┌─▼─── ┌▼────┐
   │Skills│ │n8n │ │DBs   │
   │(50+) │ │    │ │PG+QD │
   └──────┘ └────┘ └──────┘
```

## Composants

### 1. Layer Frontend

**Dashboard (Next.js + React)**
- Interface utilisateur
- Visualisation données
- Gestion workflows
- Monitoring temps réel

### 2. Layer API

**FastAPI**
- REST endpoints
- WebSocket support
- Authentication JWT
- Rate limiting
- Documentation auto (Swagger)

**Routes principales:**
```
/api/v1/skills/*       # Gestion skills
/api/v1/workflows/*    # Workflows
/api/v1/analysis/*     # Analyses entreprises
/api/v1/automation/*   # Automations
```

### 3. Orchestrateur Central

**Responsabilités:**
- Coordination skills
- Exécution workflows
- Gestion états
- Optimisation ressources

**Modules:**
```python
core_orchestrator.py    # Orchestration principale
skill_manager.py        # Gestion skills
workflow_engine.py      # Moteur workflows  
agent_coordinator.py    # Coordination agents
```

### 4. Skills Layer

**Catégories:**

1. **Business Intelligence** (12 skills)
   - digital-footprint-scanner
   - business-model-extractor
   - automation-opportunity-finder
   - competitor-intelligence
   - customer-insight-miner
   - tech-stack-auditor
   - financial-intelligence
   - legal-compliance-scanner
   - implementation-blueprint
   - monitoring-optimization
   - transformation-change-management

2. **PME Automation** (8 skills)
3. **Entrepreneur** (6 skills)
4. **RPA Platform** (10 skills)
5. **Revenue Systems** (7 skills)
6. **Idea to Product** (5 skills)
7. **Elite Agents** (12 skills)

**Total: 60 skills**

### 5. Workflow Engine (n8n)

**Workflows pré-configurés:**
- Service client automatique
- Monitoring web
- Rapports clients
- Onboarding automatique
- Business analysis

### 6. Data Layer

**PostgreSQL:**
- Données transactionnelles
- Logs workflows
- Métriques
- Utilisateurs

**Qdrant:**
- Embeddings vectoriels
- RAG (Retrieval Augmented Generation)
- Semantic search

### 7. AI Layer

**Ollama (Local LLM):**
- llama3.2 (chat, support)
- deepseek-coder (code gen)
- mistral (rapports)

**Claude API:**
- Tâches complexes
- Computer Use
- Extended thinking

### 8. Monitoring

**Prometheus:**
- Métriques temps réel
- Alerting
- Time series

**Grafana:**
- Dashboards
- Visualisation
- Rapports

## Data Flow

### Analyse Entreprise

```
1. User: POST /api/v1/analysis {url: "slack.com"}
   ↓
2. API: Crée job, retourne job_id
   ↓
3. Orchestrator: Lance 12 skills en parallèle
   ↓
4. Skills: Analysent différents aspects
   ↓
5. Orchestrator: Agrège résultats
   ↓
6. Exporters: Génère PDF/Excel/Markdown
   ↓
7. API: Retourne rapport complet
```

### Workflow Automation

```
1. Trigger: Webhook/Schedule/Event
   ↓
2. n8n: Exécute workflow
   ↓
3. Agents: Traitent tâches
   ↓
4. Database: Stocke résultats
   ▓
5. Monitoring: Track métriques
```

## Sécurité

### Layers

1. **Network:** Caddy SSL/TLS
2. **Auth:** JWT tokens
3. **API:** Rate limiting
4. **Data:** Encryption at rest
5. **Logs:** Audit trail complet

### Secrets Management

```bash
.env                    # Local dev
Docker secrets          # Production
Vault (optionnel)       # Enterprise
```

## Scalabilité

### Horizontal Scaling

```yaml
# docker-compose.scale.yml
services:
  api:
    deploy:
      replicas: 3
  orchestrator:
    deploy:
      replicas: 2
```

### Vertical Scaling

```yaml
resources:
  limits:
    cpus: '4'
    memory: 8G
  reservations:
    cpus: '2'
    memory: 4G
```

## Performances

### Métriques Cibles

| Métrique | Valeur |
|----------|--------|
| API Response | <100ms |
| Skill Execution | <5s |
| Analysis Complete | <45min |
| Uptime | 99.9% |

### Optimisations

- **Caching:** Redis pour résultats fréquents
- **Queue:** BullMQ pour tâches async
- **CDN:** Static assets
- **DB:** Indexes optimisés

## Déploiement

### Environments

1. **Development:** `docker-compose.yml`
2. **Staging:** `docker-compose.staging.yml`
3. **Production:** `docker-compose.production.yml`

### CI/CD

```yaml
# .github/workflows/deploy.yml
on: push
jobs:
  test: # Tests unitaires + intégration
  build: # Build Docker images
  deploy: # Deploy to production
```

---

**Version:** 1.0.0
**Dernière mise à jour:** 2025-11-10
