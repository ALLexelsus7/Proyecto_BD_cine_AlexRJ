# 🎬 Sistema de Gestión de Cine - Arquitectura de Base de Datos

> **Proyecto Académico (4to Semestre) - Materia: Bases de Datos I**

Este repositorio contiene el diseño, estructuración y programación de una base de datos relacional orientada a la gestión de un sistema de cine (películas, actores, directores, reparto y reseñas)[cite: 6]. El proyecto fue desarrollado utilizando **MySQL** y **phpMyAdmin** mediante XAMPP[cite: 6].

## 📺 Demostración y Explicación Técnica

En el siguiente video explico a detalle la arquitectura del proyecto, la lógica relacional y el funcionamiento de los componentes avanzados de SQL:

[**▶️ Ver la explicación del proyecto en YouTube**](https://youtu.be/CQr7aBN7AJg?si=o6faonRH8jPQ6ICw)

## 🛠️ Tecnologías y Componentes Implementados

*   **Entorno:** MySQL, phpMyAdmin, XAMPP (Apache/MySQL)[cite: 6].
*   **Componentes Avanzados de SQL:**
    *   **Stored Procedures & Functions:** Lógica de negocio encapsulada, como cálculos de salarios con impuestos o clasificación automática de presupuestos[cite: 6].
    *   **Triggers (Disparadores):** Reglas de validación de datos `BEFORE INSERT` (ej. restringir calificaciones de reseñas al rango 1-10)[cite: 6].
    *   **Views (Vistas):** Consultas complejas predefinidas utilizando múltiples `JOINs`, subconsultas y funciones matemáticas (ej. cálculo de costo por minuto de producción)[cite: 6].
    *   **Scheduled Events (Eventos Programados):** Automatización de tareas de mantenimiento cíclico para la limpieza de la base de datos[cite: 6].

## 📂 Contenido del Repositorio

*   `cine.sql`: Script principal que contiene la estructura completa de la base de datos (DDL), inserción de datos (DML) y la programación de los triggers, vistas y procedimientos.
*   `Documentacion_BD_cine.pdf`: Documentación técnica formal del proyecto. Incluye el diagrama relacional, diccionario de datos completo y capturas de pantalla de las consultas ejecutadas con éxito[cite: 6].

## ⚙️ Instrucciones de Instalación Local

1. Instala un entorno de servidor local como XAMPP o WAMP.
2. Inicia los servicios de **Apache** y **MySQL**[cite: 6].
3. Ingresa a phpMyAdmin (usualmente en `http://localhost/phpmyadmin`)[cite: 6].
4. Crea una nueva base de datos llamada `cine`[cite: 6].
5. Ve a la pestaña "Importar" y selecciona el archivo `cine.sql` incluido en este repositorio.
