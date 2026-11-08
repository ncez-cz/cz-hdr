# CORRECTIONS.md

## Repositório alvo
- **Nome:** cz-hdr
- **URL:** https://github.com/ncez-cz/cz-hdr
- **Branch padrão (upstream):** master
- **Commit-base analisado:** fa8d9ad
- **Data da elaboração:** 2026-11-08 (horário local)
- **Autor:** admeduardovieira (Kilo, REA 6.7.0)

---

## Correções implementadas

Nenhuma correção de código foi implementada, pois o repositório é um IG FHIR/SUSHI com arquivos de configuração e definições FSH, não código-fonte executável. As melhorias identificadas são de infraestrutura de build e documentação.

## Melhorias identificadas (não implementadas)

### REA-CZHDR-001 — Ausência de arquivo LICENSE
**Problema:** Nenhum arquivo LICENSE na raiz do repositório (`license: CC0-1.0` comentado no sushi-config.yaml).
**Correção proposta:** Adicionar arquivo LICENSE e descomentar/configurar a licença no sushi-config.yaml.
**Arquivos:** LICENSE (novo), sushi-config.yaml

### REA-CZHDR-002 — Sem CI/CD
**Problema:** Nenhum workflow de GitHub Actions configurado.
**Correção proposta:** Adicionar .github/workflows/ para build automático do IG via IG Publisher.
**Arquivos:** .github/workflows/*.yml (novos)

### REA-CZHDR-003 — Sem testes automatizados
**Problema:** Nenhum teste de validação dos arquivos FSH ou do IG gerado.
**Correção proposta:** Adicionar testes de validação dos arquivos FSH e do IG gerado.
**Arquivos:** novos arquivos de teste

### REA-CZHDR-004 — Ausência de arquivo README
**Problema:** Nenhum arquivo README na raiz do repositório.
**Correção proposta:** Adicionar arquivo README.md com instruções de uso, build e contribuição.
**Arquivos:** README.md (novo)

### REA-CZHDR-005 — ignoreWarnings.txt quase vazio
**Problema:** Arquivo ignoreWarnings.txt contém apenas o cabeçalho padrão, sem avisos específicos documentados.
**Correção proposta:** Preencher com avisos relevantes identificados durante o build do IG, ou remover se não for necessário.
**Arquivos:** input/ignoreWarnings.txt

---

*Este documento registra melhorias de infraestrutura identificadas, sem alterações de código-fonte.*
