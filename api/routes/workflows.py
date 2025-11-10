# FastAPI route - Workflows
from fastapi import APIRouter
router = APIRouter()

@router.get("/workflows")
def list_workflows():
    return {"workflows": ["service-client", "monitoring-web", "business-analysis", "client-onboarding", "automated-reporting"]}
