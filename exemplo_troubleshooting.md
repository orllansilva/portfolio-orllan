# Playbook de Troubleshooting (exemplo prático)

## Objetivo
Guia rápido para investigar incidentes de suporte em sistemas corporativos (ex.: Oracle EPM).

## Etapas principais
1. **Recepção**
   - Registrar ticket com: descrição, prints, passos para reproduzir, usuário, ambiente (prod/test).
   - Priorizar conforme SLA e impacto.

2. **Coleta inicial**
   - Reproduzir o problema (se possível).
   - Coletar logs relevantes (application logs, integration logs).
   - Verificar últimos deployments/patches.

3. **Análise**
   - Checar erros explícitos nos logs (palavras-chave: ERROR, EXCEPTION).
   - Rodar consultas SQL para validar dados envolvidos (usar `exemplo_SQL.sql` como base).
   - Simular cenário com dados de teste, quando seguro.

4. **Hipóteses e testes**
   - Formular 1–3 hipóteses (dados, configuração, integração).
   - Testar uma hipótese por vez; documentar evidências (passo > resultado).

5. **Ação**
   - Se for contorno: aplicar solução temporária e comunicar usuário.
   - Se for correção definitiva: planejar deployment e executar, alinhando com outros times ou usuário, se necessário.

6. **Validação**
   - Verificar com o usuário (UAT) que o comportamento voltou ao normal.
   - Rodar regressões rápidas para garantir não quebrou outras áreas.

7. **Encerramento**
   - Documentar causa raiz, correção aplicada e passos de prevenção na base de conhecimento.
   - Fechar ticket com resumo e evidências.

## Checklist rápido
- [ ] Ticket com dados completos (prints + passos)
- [ ] Logs coletados
- [ ] Consultas SQL rodadas e resultados salvos
- [ ] Hipótese testada e evidência anexada
- [ ] SR aberto com fornecedor (se aplicável)
- [ ] Documentação atualizada

## Exemplo de nota para SR com fornecedor
Resumo: Erro de integração X - falha ao importar arquivo Y em ambiente PROD.
Passos para reproduzir: ...
Logs anexados: `integration_2025-11-29.log`
Impacto: usuários A, B, C - bloqueio em processo Z.
Evidence: screenshot + SQL result (file attached).
