# 📝 Tema 3 - Notebooks Fundamentals + New Notebooks Features

---

## 1. ¿Qué es un Notebook en Databricks?

Un **notebook** en Databricks es un documento interactivo que combina:

- 📜 **Texto** con formato Markdown.  
- 💻 **Código ejecutable** en múltiples lenguajes (Python, SQL, Scala, R).  
- 📊 **Visualizaciones** (tablas, gráficos, dashboards).  
- 🤝 **Colaboración en tiempo real** entre varios usuarios.  

👉 Los notebooks son el **espacio principal de trabajo** en Databricks, ideales para explorar datos, construir pipelines y documentar procesos.

---

## 2. Fundamentos de Notebooks

### 2.1. Estructura de un Notebook
- **Celdas de código:** ejecutan Python, SQL, Scala o R.  
- **Celdas Markdown:** permiten documentar con títulos, listas, enlaces y fórmulas.  
- **Resultados:** cada celda muestra resultados tabulares, JSON, imágenes o gráficos.

### 2.2. Atajos útiles
- `Shift + Enter` → Ejecutar la celda.  
- `Ctrl + Enter` → Ejecutar sin moverse de la celda.  
- `Alt + Enter` → Ejecutar y crear una nueva celda debajo.  
- `Esc + A` → Insertar celda arriba.  
- `Esc + B` → Insertar celda abajo.  

### 2.3. Magics de lenguaje
Puedes cambiar el lenguaje dentro de un notebook con **magics**:

```sql
%sql
SELECT current_date() AS hoy
```

## 3. New Notebook Features ✨

Databricks ha mejorado los notebooks en los últimos releases.
Algunas de las funcionalidades nuevas y útiles son:

### 3.1. Variables entre lenguajes

Se pueden compartir variables entre diferentes lenguajes en el mismo notebook.

```python
# Python
valor = 42
```
SQL

```sql
-- SQL: uso de la variable Python
SELECT ${valor} AS numero_desde_python
```

### 3.2. Integración con Repos y Git
- Posibilidad de hacer commits, pull y push directamente desde el notebook.
- Barra lateral de cambios como en VS Code.

### 3.3. Visualizaciones enriquecidas
- Nuevos gráficos interactivos directamente desde resultados de SQL.
- Exportación a dashboards.

```sql
%sql
SELECT 'A' as categoria, 10 as valor
UNION ALL
SELECT 'B', 20
UNION ALL
SELECT 'C', 30
```
👉 En el resultado puedes usar la opción “Plot Options” para crear gráficos de barras o líneas.

### 3.4. Comentarios colaborativos
- Se pueden agregar comentarios en línea dentro del notebook.
- Ideal para revisiones en equipo y feedback.

### 3.5. Auto-complete inteligente
- Sugerencias de código mejoradas para SQL y Python.
- Detección de tablas, columnas y funciones Spark.

### 4. Ejercicio Práctico 🎯

1. Crea un notebook llamado fundamentos_notebooks.
2. Inserta una celda Markdown con tu nombre y fecha de hoy.
3. Ejecuta este bloque en Python:

```python
print("¡Hola, este es mi primer notebook en Databricks! 🚀")
```
4. Crea una celda en SQL para consultar la fecha actual:

```sql
SELECT current_timestamp() AS fecha_actual;
```