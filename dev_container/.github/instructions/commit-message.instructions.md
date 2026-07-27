---
description: 'Conventional Commits standards and DSP-specific conventions for all Git commit messages in this repository'
applyTo: '**'
---

# Commit Message Instructions

All commit messages in this repository must follow the **Conventional Commits 1.0.0** specification.

> **Language rule (mandatory):** The subject line and body **must be written in Lithuanian** (lt-LT), past tense, neuter gender (e.g., "pridėta", "pataisyta", "atnaujinta", "pašalinta"). Technical terms, type names, scope names, acronyms, and subsystem names (IDS, RDS, ESTAG, OpenShift, ArgoCD, Maven, Docker, etc.) remain in English. **Never write the subject in English.**

---

## Format

```
<type>(<scope>): <subject>

[body]

[footer]
```

---

## 1. Type

Required. One of the following lowercase values:

| Type | Naudojamas kai |
|------|---------------|
| `feat` | pridėtas naujas funkcionalumas |
| `fix` | pataisyta klaida |
| `docs` | pakeista tik dokumentacija |
| `style` | pakeistas formatavimas (tarpai, kabliataškiai, be logikos keitimo) |
| `refactor` | pertvarkytas kodas be naujų funkcijų ar klaidų taisymo |
| `perf` | pagerintas veiksmingumas (performance) |
| `test` | pridėti arba pakeisti testai |
| `build` | pakeista build sistema ar išorinės priklausomybės |
| `ci` | pakeista CI/CD konfigūracija |
| `chore` | atlikti pagalbiniai pakeitimai, neįtakojantys source ar test failų |
| `revert` | atšauktas ankstesnis commit |

---

## 2. Scope

Optional. A short noun in parentheses identifying the subsystem or area changed. Use lowercase.

Preferred scopes for this repository:

- DSP subsystems: `ids`, `rds`, `estag`, `orbeon`, `infra`, `gitops`
- Documentation areas: `docs`, `solution-design`, `diagrams`, `architektura`
- Tooling / scripts: `mcp`, `confluence-api`, `jenkins-api`, `openshift-api`, `d2`
- Repository meta: `deps`, `ci`, `config`, `devcontainer`
- dsp-ids specific: `auth`, `activiti`, `integration`, `product-service`, `web`

---

## 3. Subject

- **Must be written in Lithuanian (lt-LT)** — this is mandatory. Never use English for the subject.
- **Past tense, neuter gender** (e.g., "pridėta", "pašalinta", "atnaujinta", "pataisyta") — the action is already completed. Do not use the infinitive ("pridėti", "pataisyti") or the imperative ("pridėk", "pataisyk").
- Lowercase first letter (unless a proper noun)
- No period at the end
- Max **72 characters** (including type and scope prefix)
- Technical terms, acronyms, and subsystem names (IDS, RDS, ESTAG, OpenShift, ArgoCD, etc.) remain in English within the Lithuanian sentence

**Good examples:**

```
feat(rds): pridėtas naujas orbeon formos duomenų perdavimo endpoint
fix(ids): pataisyta OIDC token atnaujinimo klaida
docs(solution-design): atnaujintas RDS konteinerių architektūros dokumentas
ci: atnaujinta GitLab pipeline konfigūracija
chore(deps): atnaujintos Python priklausomybės
refactor(mcp): supaprastinta dokumentų indeksavimo logika
```

**Bad examples:**

```
Updated things.                  ← nėra tipo, anglų kalba, neapibrėžta
fix: Fixed the bug.              ← anglų kalba, taškas pabaigoje
FEAT(IDS): Pridėtas naujas API    ← didžiosios raidės type ir scope
feat: pridėti naują API          ← infinitive (pridėti) — naudok būtąjį laiką (pridėta)
docs: atnaujintas dokumentas     ← be tipo prefikso
```

---

## 4. Body

Optional. Use when the subject alone cannot fully describe the change.

- Separate from subject with a **blank line**
- Wrap at **72 characters** per line
- Explain *what* changed and *why*, not *how*
- May be written in Lithuanian or English (technical details)

---

## 5. Footer

Optional. Used for:

- **Breaking changes:** `BREAKING CHANGE: <description>`
- **Issue/ticket references:** `Closes #123`, `Refs #456`
- **Co-authors:** `Co-authored-by: Name <email>`

Breaking changes must also be marked with `!` after the type/scope:

```
feat(ids)!: pašalinta pasenusi autentifikacijos API

BREAKING CHANGE: /api/v1/auth endpoint pašalintas. Naudokite /api/v2/auth.
```

---

## 6. Multi-commit messages (revert)

When reverting a commit:

```
revert: feat(rds): pridėtas naujas orbeon formos duomenų perdavimo endpoint

Refs: abc1234
```

---

## 7. Quick reference

```
feat(scope): pridėta X
fix(scope): pataisyta X
docs(scope): atnaujinta X dokumentacija
refactor(scope): pertvarkyta X
chore(deps): atnaujinta X priklausomybė iki vX.Y.Z
ci: atnaujinta X pipeline
```