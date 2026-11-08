# REVERSE_ENGINEERING_REPORT.en.md

## Target repository
- **Name:** cz-hdr
- **URL:** https://github.com/ncez-cz/cz-hdr
- **Default branch (upstream):** master
- **Base commit analyzed:** fa8d9ad (Update hdrStructure.md)
- **Project version:** 0.5.0 (sushi-config.yaml), status draft
- **Local working folder:** C:\Users\User\audit-repos\cz-hdr
- **Audit folder:** C:\Users\User\audit-repos\audit-work
- **Audit date/time:** 2026-11-08 (local time)
- **Environment:** Windows, PowerShell 5.1, Git 2.49.0, Python 3.12.14 (without SUSHI/IG Publisher installed)

---

## A. General diagnosis

### Architecture identified
FHIR R4 Implementation Guide for Czech Hospital Discharge Report, built with SUSHI. National specification for hospital discharge reports in the Czech Republic.

Structure:
- `sushi-config.yaml` — IG configuration (id ncez.cz.fhir.hdr, canonical https://ncez.mzcr.cz/standards/fhir/ig/hdr, name CzHdrImplementationGuide, version 0.5.0, status draft, releaseLabel ci-build, fhirVersion 4.0.1, jurisdiction CZ, dependencies hl7.fhir.uv.ips current and ncez.cz.fhir.core current)
- `ig.ini` — points to generated ImplementationGuide in fsh-generated/resources/, template fhir.base.template#current
- `input/fsh/` — FSH files organized in subfolders: alias.fsh, and subfolders codesystems/, invariants/, model/, profiles/, rulesets/, valuesets/
- `input/pagecontent/` — Markdown pages
- `input/images/` — images
- `input/includes/` — includes
- `input/ignoreWarnings.txt` — nearly empty (header only)
- Build scripts: _build.bat/.sh, _genonce.bat/.sh, _gencontinuous.bat/.sh, _updatePublisher.bat/.sh
- `.gitignore` — ignores /fsh-generated, /input-cache, /output, /temp, /template
- No LICENSE file at root
- No README file at root
- No .github (no CI/CD configured)

### Technologies and dependencies
- SUSHI (FHIR Shorthand)
- FHIR R4 (fhirVersion: 4.0.1)
- Dependencies: hl7.fhir.uv.ips current, ncez.cz.fhir.core current
- Template: fhir.base.template#current
- IG Publisher (downloaded via build scripts, not versioned in Git)
- Java (to run publisher.jar)
- License: not declared (`license: CC0-1.0` commented out in sushi-config.yaml:16)

### Maintenance status
- Active: version 0.5.0, status draft, releaseLabel ci-build
- Last commit: fa8d9ad (Update hdrStructure.md)
- Short history: 10 commits (initial commit, version 1.0.0, refactoring, FSH file updates)
- No CI/CD configured (no .github/workflows)
- No automated tests visible

### Existing test mechanisms
- No automated code tests for FSH files
- Validation via IG Publisher (external, would run manually via build scripts)
- ignoreWarnings.txt nearly empty (header only)

### Investigation limitations
- SUSHI and IG Publisher not installed → impossible to execute IG build locally
- Analysis based on static inspection of YAML configuration, FSH files, build scripts and documentation

---

## B. Problems found

| ID | Location | Problem | Status | Severity | Evidence |
|----|----------|---------|--------|----------|-----------|
| REA-CZHDR-001 | Absent | No LICENSE file at repository root (`license: CC0-1.0` commented out in sushi-config.yaml:16) | CONFIRMED (static) | P2 | sushi-config.yaml line 16: `# license: CC0-1.0`; root directory listing does not contain LICENSE |
| REA-CZHDR-002 | Absent | No CI/CD configured (no .github/workflows) | CONFIRMED (static) | P3 | No .github directory in repository |
| REA-CZHDR-003 | Absent | No automated tests for FSH files | CONFIRMED (static) | P3 | No test files found in repository |
| REA-CZHDR-004 | Absent | No README file at repository root | CONFIRMED (static) | P3 | Root directory listing does not contain README.md |
| REA-CZHDR-005 | `input/ignoreWarnings.txt` | File nearly empty (header only) → no documentation of suppressed warnings | HYPOTHESIS | P3 | ignoreWarnings.txt lines 1-5 (header only) |

### No P0 or P1 problems
No critical problem confirmed.

---

## C. Recurring problems
No issues and no PRs on GitHub (both lists empty). No recurring documented problems identified. Repository has short history (10 commits) and little issue/PR activity.

---

## D. Undocumented errors
REA-CZHDR-001 to REA-CZHDR-005 were not documented in issues/PRs.

---

## E. Performance
No relevant performance opportunities in a FHIR IG (build executed externally via IG Publisher).

---

## F. Technical improvements
1. Add LICENSE file at root (REA-CZHDR-001)
2. Configure CI/CD (GitHub Actions) for automated IG build (REA-CZHDR-002)
3. Add automated FSH/IG validation tests (REA-CZHDR-003)
4. Add README file at root with usage and contribution instructions (REA-CZHDR-004)
5. Populate ignoreWarnings.txt with relevant warnings or remove if not needed (REA-CZHDR-005)

---

## G. Execution plan
All improvements are independent and low risk, but there is no complex source code to fix. These are build infrastructure and documentation improvements.

---

## H. Expected result
IG with declared license, automated CI/CD, validation tests, README with instructions, populated or removed ignoreWarnings.txt.

---

## Malware and threat analysis (static)
**Result:** No indicator identified by the static analysis performed.
- Only configuration files (YAML, INI, FSH, MD), build scripts (BAT, SH) and images
- No credentials, keys, tokens or passwords embedded
- No suspicious shell commands, subprocess, exec, eval, persistence, obfuscation or data exfiltration
- It is not stated that the project is free of malware.

---

## Mandatory final questions
1. **Which critical bugs were confirmed?** None P0/P1.
2. **Which recurring problems have developers not yet resolved?** No issues or PRs on GitHub; recurring problems could not be identified.
3. **Which important errors were not documented?** Absence of LICENSE, no CI/CD, no automated tests, no README, empty ignoreWarnings.txt.
4. **Which performance opportunities were found?** None relevant.
5. **Which security and reliability improvements are justifiable?** Add LICENSE, add CI/CD, add tests, add README, populate ignoreWarnings.txt.
6. **Which fixes can be made quickly?** Add LICENSE, add README, uncomment license in sushi-config.yaml.
7. **Which are the three contributions with highest technical value?** (a) Add LICENSE, (b) Configure CI/CD for IG build, (c) Add README with usage instructions.
8. **Which fixes should be avoided for lack of evidence?** None — all are well-founded build infrastructure improvements.
9. **Which modifications do you recommend implementing first?** Add LICENSE and README (low risk, high impact on usability and compliance).
