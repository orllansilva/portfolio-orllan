# exemplo_python_validacao.py
# Script simples para validar CSV de importação: checar linhas com campos vazios e somatório

import csv
from pathlib import Path

INPUT = Path('amostra_import.csv')  # coloque um CSV de exemplo com colunas id, account, amount

def validar_csv(path):
    empty_rows = []
    total_amount = 0.0
    count = 0
    with open(path, newline='', encoding='utf-8') as f:
        reader = csv.DictReader(f)
        for i, row in enumerate(reader, start=1):
            count += 1
            if not row.get('id') or not row.get('account'):
                empty_rows.append(i)
            try:
                total_amount += float(row.get('amount') or 0)
            except ValueError:
                print(f"Linha {i}: amount inválido -> {row.get('amount')}")
    print(f"Linhas lidas: {count}")
    print(f"Linhas com campos obrigatórios vazios: {empty_rows}")
    print(f"Total amount: {total_amount:.2f}")

if __name__ == '__main__':
    if not INPUT.exists():
        print(f"Arquivo {INPUT} não encontrado (coloque um CSV de amostra).")
    else:
        validar_csv(INPUT)
