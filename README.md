# Enterprise Legal Document Review Platform

> A sanitized portfolio architecture for a large document-review and case-support platform.

## What this demonstrates

This project shows how I design and operate a mixed .NET platform across Azure AKS and on-premises HCI, with separate external APIs, internal workers, queue-driven processing and production observability.

## Scale and service boundaries

The application is modeled as **15 independently deployable .NET 8 services**:

- document-api and document-preview
- document-ingestion and export-service
- matter-service and review-workflow
- annotation-service and metadata-service
- search-service and reporting-service
- notification-service and integration-service
- identity-adapter, audit-service and user-preferences

External-facing services are routed through ingress. Internal services remain ClusterIP-only and communicate through service discovery and queues.

## Platform stack

- **Cloud:** Microsoft Azure, AKS, Azure Container Registry, Azure Monitor
- **Hybrid:** Linux application nodes plus Windows build-agent capacity and on-premises HCI patterns
- **Delivery:** Azure DevOps path-filtered builds, container scanning and environment promotion
- **Infrastructure:** Terraform modules for AKS, ACR, node pools, Redis and monitoring; Ansible for host/bootstrap and Velero tasks
- **Scaling:** HPA for request-driven APIs and KEDA for queue/build-agent demand
- **Data and platform services:** Redis, MongoDB, Elasticsearch, Service Bus and OpenTelemetry
- **Observability:** Prometheus, Grafana, Datadog and Azure Monitor

## Portfolio highlights

- 15 service deployment and service templates
- External/internal network boundaries with NetworkPolicy
- Windows and Linux AKS node-pool design
- Queue-based KEDA scaling for ingestion workloads
- Azure DevOps path filters to avoid unnecessary builds
- Terraform and Ansible separation of infrastructure and configuration work
- Velero-style backup/restore automation
- Local Kubernetes Docker Compose development flow

## Repository map

- `deploy/k8s/` — application, infrastructure, HPA, KEDA and network manifests
- `infra/terraform/` — Azure, node-pool, Redis and monitoring patterns
- `ansible/` — host baseline, patching, deployment and Velero tasks
- `azure-devops/` — path-filtered build and promotion examples
- `docker-compose/` — local Kubernetes-like development
- `docs/` — runtime flow, service catalog and sanitized enterprise patterns

This repository is intentionally sanitized. It contains no client names, credentials, private endpoints, protected documents or production secrets.
