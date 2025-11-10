# Taller de Lakeflow Spark Declarative Pipelines

Un taller práctico de 1.5 horas que enseña Databricks Lakeflow Spark Declarative Pipelines (antes Delta Live Tables) con foco en calidad de datos, Change Data Capture y mejores prácticas de producción.

## Estructura del Taller

```
workshop/
├── Setup/
│   └── 0-SETUP.py                          # Ejecuta ESTO PRIMERO: crea catálogo, esquemas, volumen, datos de ejemplo
│
├── Exercise_1/ (40 minutos)
│   └── 1-Building_Pipelines_with_Data_Quality.sql   # Notebook con instrucciones
│
├── Exercise_2/ (50 minutos)
│   ├── 2-Production_CDC_and_Scheduling.sql  # Notebook con instrucciones  
│   └── customers_pipeline.sql               # Muévelo a /transformations durante el ejercicio
│
└── transformations/
    └── orders_pipeline.sql                  # Ya presente para el Exercise 1
    (customers_pipeline.sql se agrega aquí en el Exercise 2)
```

## Prerrequisitos

- Workspace de Databricks con Unity Catalog habilitado
- Privilegios de CREATE CATALOG
- Compute Serverless habilitado (recomendado) o acceso para crear clústeres

## Primeros Pasos

### Paso 1: Importar Archivos del Taller

1. En el workspace de Databricks, navega a tu directorio principal
2. Importa todos los archivos del taller manteniendo la estructura de carpetas
3. Debes tener las carpetas: `Setup/`, `Exercise_1/`, `Exercise_2/` y `transformations/`

### Paso 2: Ejecutar Setup

1. Abre `Setup/0-SETUP.py`
2. Ejecuta TODAS las celdas en orden
3. **Guarda los valores de salida**: los necesitarás para configurar el pipeline:
   - Default Catalog: `sdp_workshop_<your_username>`
   - Default Schema: `bronze`
   - Variable de configuración `source`: `/Volumes/sdp_workshop_<your_username>/default/raw`

### Paso 3: Exercise 1 - Construir Pipelines con Calidad de Datos

**Duración:** ~50 minutos

**Qué aprenderás:**
- Crear un Lakeflow Spark Declarative Pipeline
- Implementar arquitectura medallion (Bronze → Silver → Gold)
- Aplicar expectativas de calidad de datos
- Usar Auto Loader para ingesta incremental
- Trabajar con el editor de pipelines multi‑archivo

**Archivos usados:**
- `Exercise_1/1-Building_Pipelines_with_Data_Quality.sql` (instrucciones)
- `transformations/orders_pipeline.sql` (código del pipeline)

**Pasos clave:**
1. Abre el notebook del Exercise 1
2. Sigue las instrucciones para crear tu primer pipeline
3. Configura los ajustes con los valores del setup
4. Ejecuta el pipeline y observa resultados

### Paso 4: Exercise 2 - CDC y Producción

**Duración:** ~60 minutos

**Qué aprenderás:**
- Implementar Change Data Capture usando AUTO CDC INTO
- Entender SCD Tipo 1 (slowly changing dimensions)
+- Manejar operaciones INSERT, UPDATE, DELETE automáticamente
- Agregar nuevas fuentes a pipelines existentes
- Programar pipelines para producción
- Aplicar mejores prácticas de producción

**Archivos usados:**
- `Exercise_2/2-Production_CDC_and_Scheduling.sql` (instrucciones)
- `Exercise_2/customers_pipeline.sql` (lo moverás a `transformations/`)

**Pasos clave:**
1. Abre el notebook del Exercise 2
2. Revisa el código de `customers_pipeline.sql`
3. **Mueve** `customers_pipeline.sql` de `Exercise_2/` a `transformations/`
4. El pipeline detecta automáticamente el nuevo archivo
5. Genera datos CDC de ejemplo y ejecuta el pipeline
6. Programa el pipeline para producción

## Qué se Crea

### Arquitectura de Datos

**Catálogo:** `sdp_workshop_<username>`

**Esquemas:**
- `bronze` - Capa de ingesta raw
- `silver` - Datos limpios y validados
- `gold` - Agregaciones de negocio

**Tablas (Exercise 1):**
- `bronze.orders` - JSON de pedidos raw
+- `silver.orders_clean` - Pedidos validados
- `gold.order_summary` - Agregaciones diarias

**Tablas (agrega Exercise 2):**
- `bronze.customers_raw` - Eventos CDC raw
- `bronze.customers_clean` - Eventos CDC validados
- `silver.customers` - Estado actual de clientes (SCD Tipo 1)
- `gold.customer_summary` - Analítica de clientes

**Volumen:**
- `sdp_workshop_<username>.default.raw` - Zona de aterrizaje de archivos fuente
  - `orders/` - Archivos JSON de pedidos
  - `status/` - Archivos JSON de estatus (para uso futuro)
  - `customers/` - Eventos CDC de clientes

## Conceptos Clave Cubiertos

### Exercise 1
- **Streaming Tables**: Tablas actualizadas incrementalmente
- **Materialized Views**: Agregaciones eficientes
- **Auto Loader**: `read_files()` para ingesta incremental de archivos
- **Expectativas de Calidad de Datos**: Cumplimiento en la ingesta
- **Arquitectura Medallion**: Patrón Bronze → Silver → Gold
- **Editor Multi‑archivo**: Desarrollo tipo IDE

### Exercise 2
- **AUTO CDC INTO**: CDC declarativo
- **SCD Tipo 1**: Seguimiento del estado actual
- **Cláusula KEYS**: Match por clave primaria
- **SEQUENCE BY**: Ordenamiento de eventos
- **APPLY AS DELETE**: Manejo de eliminaciones
- **Programación para Producción**: Modos continuo y programado
- **Monitoreo**: Métricas de calidad y rendimiento

## Mejores Prácticas Demostradas

1. **Calidad de datos**: Expectations en capas bronze y silver
2. **Prevención de reset**: `pipelines.reset.allowed = false`
3. **Procesamiento incremental**: Solo datos nuevos
4. **Validación antes de CDC**: Siempre valida antes de aplicar cambios
5. **Metadatos**: Nombres de archivo fuente, tiempos de procesamiento
6. **Ajustes de producción**: Programación, notificaciones, monitoreo
7. **Documentación**: Comentarios y propiedades de tablas

## Resolución de Problemas

### "Variable 'source' not found"
- Ve a Pipeline Settings → Configuration
- Agrega key: `source`, value: ruta del setup

### "Schema not found"
- Verifica que el notebook de setup se ejecutó correctamente
- Revisa el nombre del catálogo en ajustes del pipeline

### "Permission denied"
- Asegúrate de tener privilegios CREATE en Unity Catalog
- Contacta al admin si es necesario

### El pipeline no encuentra archivos nuevos
- Revisa que la ruta del volumen sea correcta
- Verifica que los archivos existan (explorador de archivos de Databricks)
- Asegura que el formato sea JSON

### CDC no aplica cambios correctamente
- Verifica que la columna de `SEQUENCE BY` tenga timestamps correctos
- Revisa que `KEYS` coincida con tu clave primaria
- Asegura que los valores de `operation` sean correctos (INSERT/UPDATE/DELETE)

## Recursos Adicionales

- [Documentación de Lakeflow](https://docs.databricks.com/en/delta-live-tables/index.html)
- [Referencia de AUTO CDC INTO](https://docs.databricks.com/en/delta-live-tables/cdc.html)
- [Expectativas de Calidad de Datos](https://docs.databricks.com/en/delta-live-tables/expectations.html)
- [Mejores Prácticas de Unity Catalog](https://docs.databricks.com/en/data-governance/unity-catalog/best-practices.html)

## Cronograma del Taller

| Tiempo | Actividad | Archivos |
|------|----------|-------|
| 0:00-0:10 | Setup e Introducción | 0-SETUP.py |
| 0:10-0:50 | Exercise 1: Pipelines con Calidad de Datos | 1 - Building Pipelines with Data Quality.sql |
| 0:50-1:40 | Exercise 2: CDC y Producción | 2 - CDC and Production.sql |
| 1:40-2:00 | Q&A / Tiempo extra | |

## Soporte

Para dudas o problemas con este taller:
1. Revisa la sección de resolución de problemas arriba
2. Consulta la documentación de Databricks
3. Contacta a tu instructor del taller o soporte de Databricks

---

**Versión:** 1.0  
**Última actualización:** Noviembre 2025  

