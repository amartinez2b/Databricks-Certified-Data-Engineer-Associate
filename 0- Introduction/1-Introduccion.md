# Tema 1 - Introducción a Databricks

## 1. ¿Qué es Databricks?

Databricks es una **plataforma unificada de datos y analítica en la nube**, diseñada para simplificar el trabajo con grandes volúmenes de datos y aprendizaje automático.  
Fue fundada por los creadores de **Apache Spark** y combina:

- **Ingesta y procesamiento de datos** en tiempo real o batch.  
- **Almacenamiento y gestión** con Delta Lake.  
- **Análisis y visualización** con SQL, Python, R, Scala o Java.  
- **Machine Learning e IA** con MLflow y bibliotecas integradas.  
- **Colaboración** en notebooks compartidos.  

👉 En pocas palabras: **Databricks = Spark + Data Lake + SQL + ML + Gobernanza**, todo dentro de un mismo espacio.

---

## 2. Creación de un Workspace en Databricks Free Edition (AWS)

### Paso 1: Registro
1. Accede a [Databricks Free Edition](https://docs.databricks.com/aws/en/getting-started/free-edition).  
2. Haz clic en **Get Started for Free**.  
3. Regístrate con tu correo (o cuenta corporativa).  

### Paso 2: Selección de nube
- Selecciona **AWS** como proveedor de nube (la Free Edition está disponible ahí).  

### Paso 3: Creación del Workspace
1. Indica un nombre para tu workspace.  
2. Selecciona la región donde quieras desplegarlo.  
3. Haz clic en **Continue** → **Confirm**.  

### Paso 4: Activación
- Databricks creará el workspace en pocos minutos.  
- Recibirás un correo con el link de acceso.  

### Paso 5: Primer acceso
- Entra al workspace desde el link recibido.  
- Verás el **Databricks Console** con accesos a:  
  - **Compute (Clusters)**  
  - **Repos**  
  - **Workflows**  
  - **Data Explorer**  
  - **SQL Editor**  
  - **Notebooks**  

---

## 3. Ejercicio Práctico - Tu primer Notebook en Databricks

🎯 **Objetivo:** crear un notebook, ejecutar código en Python y SQL, y validar que tu entorno funciona.

### Instrucciones

1. En tu Workspace, haz clic en **Workspace → Users → [Tu Usuario] → Create → Notebook**.  
2. Ponle nombre: `Mi_Primer_Notebook`.  
3. Selecciona el lenguaje por defecto: **Python**.  
4. Adjunta tu notebook a un clúster (puede ser un *Community Cluster*).  

### Código de ejemplo

#### Python: "Hola Databricks"
```python
print("¡Hola, Databricks! 🚀")
data = [("Juan", 25), ("María", 30), ("Luis", 35)]
df = spark.createDataFrame(data, ["Nombre", "Edad"])
display(df)
```
#### SQL: "Mostrar las bases"

```sql
SHOW DATABASES;
```

