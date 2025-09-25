# Databricks Certified Data Engineer Associate

## 🚀 Pasos para subir tu proyecto local a GitHub

### Inicializar Git en tu proyecto local

En la terminal, dentro de la carpeta de tu proyecto, ejecuta:

```sh
cd ruta/de/tu/proyecto
# 👉 Esto convierte la carpeta en un repositorio Git (se crea una carpeta oculta .git).
git init
# Agregar archivos al staging
# Con esto, todos los archivos del proyecto están listos para ser confirmados.
git add .
# Hacer el primer commit
git commit -m "Primer commit: inicializando mi proyecto 🚀"
```
### Crear un repositorio en GitHub

	1.	Entra a tu cuenta de GitHub.
	2.	Haz clic en New Repository.
	3.	Ponle un nombre (ejemplo: mi-proyecto).
	4.	Elige si será público o privado.
	5.	Haz clic en Create Repository.

👉 GitHub te dará una URL, algo así como:

```sh
https://github.com/amartinez2b/Databricks-Certified-Data-Engineer-Associate.git
```

### Conectar tu repo local con GitHub

En tu terminal, enlaza el remoto de GitHub con tu repo local:

```sh
git remote add origin https://github.com/amartinez2b/Databricks-Certified-Data-Engineer-Associate.git
git branch -M main   # renombra la rama actual a main (opcional)
# 👉 Esto sube tu proyecto a GitHub en la rama main.
git push -u origin main
```