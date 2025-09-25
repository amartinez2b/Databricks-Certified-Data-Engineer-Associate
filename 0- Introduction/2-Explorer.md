# 📝 Tema 2 - Explorando el Workspace, Repositorio Git y Creación de un Clúster

---

## 1. Explorando el Workspace de Databricks

El **Workspace** es el entorno de trabajo principal de Databricks. Desde aquí los usuarios pueden:

- 📂 **Workspace:** crear y organizar carpetas, notebooks y librerías.  
- ⚙️ **Compute:** gestionar clústeres y pools de cómputo.  
- 📊 **Data:** explorar bases de datos, tablas y Delta Tables.  
- 📑 **Repos:** conectar repositorios Git y versionar notebooks.  
- 📅 **Workflows:** programar tareas y pipelines.  
- 🔍 **SQL Editor:** ejecutar queries SQL y crear dashboards.  

👉 El Workspace es colaborativo: permite a múltiples usuarios trabajar sobre notebooks compartidos en tiempo real.  

---

## 2. Repositorio Git en Databricks

Databricks permite integrar repositorios Git para **control de versiones** y **colaboración en equipo**.

### ¿Qué puedes hacer con Repos?
- Clonar un repositorio directamente en el Workspace.  
- Sincronizar notebooks con **GitHub, GitLab, Bitbucket o Azure DevOps**.  
- Usar **branching, pull requests y commits** dentro de Databricks.  

### Pasos para conectar un repo
1. Ir a la sección **Repos → Add Repo**.  
2. Pegar la URL de tu repositorio Git.  
3. Autenticarse (token personal de acceso).  
4. Seleccionar la rama con la que trabajarás.  
5. ¡Listo! Ya puedes hacer **git pull / git commit / git push** desde el mismo notebook.  

---

## 3. Creación de un Clúster

Un **clúster** es un conjunto de recursos de cómputo donde se ejecutan las tareas de Spark.  
En Databricks, los clústeres pueden ser **interactivos** (para desarrollo) o **job clusters** (para producción).

### Pasos para crear un clúster
1. Ir a **Compute → Create Cluster**.  
2. Asignar un nombre al clúster (ejemplo: `cluster-curso-dea`).  
3. Seleccionar la versión de **Databricks Runtime** (ejemplo: 12.x con soporte para ML o Photon).  
4. Definir el **modo de despliegue**:  
   - Single Node (para pruebas pequeñas).  
   - Standard (para procesamiento distribuido).  
5. Seleccionar el tamaño de las instancias (ejemplo: `i3.xlarge` en AWS o `Standard_DS3_v2` en Azure).  
6. Configurar **Auto Termination** (ejemplo: 30 min de inactividad).  
7. Crear el clúster y esperar a que cambie de estado **Pending → Running**.  

### Notas importantes
- ⚡ El clúster es donde realmente corre Spark.  
- 📊 Todos los notebooks deben estar **asociados a un clúster** para ejecutarse.  
- 💰 Configurar bien el clúster es clave para optimizar costos.  

---

## 4. Ejercicio Práctico 🎯

1. **Explorar Workspace**  
   - Crea una carpeta en tu Workspace llamada `Curso_DataEngineerAssociate`.  
   - Dentro, crea un **notebook vacío** llamado `Exploracion_Workspace`.

2. **Conectar un Repo Git**  
   - Conecta tu repo (por ejemplo en GitHub o Azure DevOps).  
   - Sincroniza el notebook `Exploracion_Workspace`.  

3. **Crear un Clúster**  
   - Crea un clúster con nombre `cluster_curso`.  
   - Configura Auto Termination en 30 minutos.  

4. **Validar tu entorno**  
   - Ejecuta el siguiente código en tu notebook:

```python
# Python
print("✅ Mi Workspace y Clúster están listos para trabajar en Databricks!")
``` 