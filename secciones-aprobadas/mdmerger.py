import os
import re

def natural_sort_key(filename):
    """Ordenar números de forma natural (cap01, cap02, cap10)"""
    return [int(c) if c.isdigit() else c.lower() for c in re.split(r'(\d+)', filename)]

def merge_order_key(filename):
    """Prólogo primero, capítulos en orden, epílogo al final."""
    name = filename.lower()
    if name.startswith('prologo'):
        return (0, natural_sort_key(filename))
    if name.startswith('epilogo'):
        return (2, natural_sort_key(filename))
    if name.startswith('cap'):
        return (1, natural_sort_key(filename))
    return (1, natural_sort_key(filename))

# Obtener todos los archivos .md
md_files = [f for f in os.listdir('.')
            if f.endswith('.md')
            and f not in ['../MANUSCRITO.md', 'MANUSCRITO.md', 'mdmerger.py']]

# Ordenar: prólogo → capítulos → epílogo
md_files.sort(key=merge_order_key)

print("Uniendo archivos en este orden:")
for i, f in enumerate(md_files, 1):
    print(f"  {i}. {f}")

# Unir archivos
with open("../MANUSCRITO.md", 'w', encoding='utf-8') as outfile:
    for i, archivo in enumerate(md_files):
        # Separador entre archivos
        if i > 0:
            outfile.write("\n\n---\n\n")
        
        # Indicador del archivo
        outfile.write(f"<!-- {archivo} -->\n\n")
        
        # Contenido original
        with open(archivo, 'r', encoding='utf-8') as infile:
            outfile.write(infile.read())
        
        # Asegurar salto de línea
        outfile.write("\n")

print(f"\nUNION COMPLETADA")
print(f"Archivos unidos: {len(md_files)}")
print(f"Resultado guardado en: ../MANUSCRITO.md")