# 📝 Tema 4 - Git Folders + Delta Lake (Conceptos Introductorios)

---

## 1. Git Folders en Databricks

Los **Git Folders** permiten integrar tu Workspace de Databricks con repositorios Git externos para gestionar el **versionamiento del código y los notebooks**.

### 1.1. ¿Por qué usar Git Folders?
- 🔄 Control de versiones: cada cambio queda registrado.  
- 👥 Colaboración: múltiples usuarios trabajan en ramas distintas.  
- 🚀 Integración con CI/CD: despliegues automatizados desde GitHub, GitLab o Azure DevOps.  
- 📝 Trazabilidad: saber quién cambió qué y cuándo.  

### 1.2. Cómo configurar un Git Folder
1. En el Workspace, ve a la sección **Repos**.  
2. Haz clic en **Add Repo**.  
3. Ingresa la URL del repositorio Git (HTTPS).  
4. Conéctate con tu **token personal de acceso**.  
5. Selecciona la rama (`main`, `develop`, etc.).  
6. Databricks creará una **carpeta sincronizada** con el repositorio.  

👉 Ahora puedes hacer commits y pull requests directamente desde el notebook.

---

## 2. Delta Lake - Conceptos Introductorios

### 2.1. ¿Qué es Delta Lake?
**Delta Lake** es una capa de almacenamiento de código abierto que mejora los data lakes tradicionales, agregando:
- ✅ **ACID transactions** (Atomicidad, Consistencia, Aislamiento, Durabilidad).  
- 📂 **Versionado de datos (Time Travel)** para consultas históricas.  
- 📊 **Esquemas estructurados** con enforcement automático.  
- ⚡ **Alto rendimiento** para lecturas y escrituras en grandes volúmenes.  

👉 En pocas palabras: **Delta Lake convierte un Data Lake en un Data Warehouse confiable y transaccional**.

---

### 2.2. Ventajas frente a un Data Lake tradicional
- **Parquet** por sí solo guarda datos pero no maneja transacciones.  
- **Delta Lake** asegura que las operaciones de escritura/lectura sean consistentes, incluso en escenarios concurrentes.  
- Permite **upserts y deletes**, que no son posibles en Parquet estándar.  

---

### 2.3. Principales funcionalidades de Delta Lake
1. **ACID Transactions**  
   Ejemplo: si dos procesos intentan escribir en la misma tabla, Delta asegura consistencia.  

2. **Time Travel**  
   Consultar versiones anteriores de la tabla.  

```sql
DESCRIBE HISTORY samples.nyctaxi.trips;
SELECT * FROM samples.nyctaxi.trips VERSION AS OF 456;
```

3. Schema Enforcement & Evolution
Delta valida el esquema al escribir datos y puede evolucionar si lo configuras.

4. Upserts & Deletes
Soporte para operaciones tipo MERGE INTO.

### 3. Ejercicio Práctico 🎯

Parte A: Git Folders
1.	Conecta tu repo Git al Workspace.
2.	Crea un notebook dentro de esa carpeta y haz un commit inicial con el mensaje:

"Primer commit desde Databricks 🚀"

Parte B: Delta Lake
1. Crea una tabla Delta a partir de un DataFrame en Python:

```python
data = [("Juan", 25), ("María", 30), ("Luis", 35)]
df = spark.createDataFrame(data, ["Nombre", "Edad"])

df.write.format("delta").mode("overwrite").saveAsTable("default.tabla_delta")
```

2. Lee los datos desde Delta:

```python
df_delta = spark.table("default.tabla_delta")
display(df_delta)
```

3. Haz una consulta SQL sobre la tabla:

```sql
SELECT * FROM default.tabla_delta;
```