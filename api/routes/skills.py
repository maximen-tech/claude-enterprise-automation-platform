# FastAPI route - Skills
from fastapi import APIRouter
router = APIRouter()

@router.get("/skills")
def list_skills():
    return {"skills": ["digital-footprint-scanner", "business-model-extractor", "automation-opportunity-finder", "competitor-intelligence", "customer-insight-miner", "tech-stack-auditor", "financial-intelligence", "legal-compliance-scanner", "implementation-blueprint", "monitoring-optimization", "transformation-change-management", "pme-automation", "entrepreneur", "rpa-platform", "revenue-systems", "idea-to-product", "elite-agents"]}
