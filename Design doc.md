# Crochapp
#probando pull request

Link: [Link a este design doc](#)

Author(s): Gabriel Gonzev

<!-- draft, ready for review, in review, reviewed -->

Status: **_draft_**

Ultima actualización: 07-02-2024

## Contenido

- Goals
- Non-Goals
- Background
- Overview
- Detailed Design
  - Solucion 1

## Links

- [Figma](www.figma.com/file/1DRgGGqcX6LhxPoEL6MusC/Crochapp?type=design&node-id=18%3A181&mode=design&t=FELVyruiXNPzaiWQ-1)

## Objetivo

Es una aplicación móvil , para que las personas puedan guardar el avance de sus proyectos de tejidos y también información sobre patrones de crochet.

## Goals

- Guardar patrones de crochet con imagenes.
- Tener un contador de puntos digital.
- Guardar avances de proyectos de crochet.

## Non-Goals

- Guardar data en algún almacenamiento en la nube.

## Background

Hace un tiempo por hobby aprendí a tejer, habia aplicaciones que no se entendían muy bien el funcionamiento o tenían demasiada publicidad.
Tambien hago este proyecto para aprender Flutter.

## Overview

Necesitamos conocer Flutter y Hive para el tema de almacenamiento.

## Detailed Design

## Solution 1

### Patrones

- _Obtener todos los patrones:_ Se usará una función llamada getAllPatterns para obtener los patrones de crochet.
- _Obtener solo un patron:_ Se usará una función llamada getPatternById, con un parametro ID, para obtener un patrón en específico.
- _Actualizar un patron:_ Se usará una función llamada updatePatternById, con un parametro ID, para actualizar los valores de un patrón en específico.
- _Borrar un patrón:_ Se usará una función llamada deletePatternById, con un parametro ID, para borrar un patrón en especifico.
- _Borrar todos los patrones:_ Se usará una función llamada deleteAllPatterns para borrar todos los patrones.

### Proyectos

- _Obtener todos los proyectos:_ Se usará una función llamada getAllProjects para obtener los proyectos de crochet.
- _Obtener solo un proyecto:_ Se usará una función llamada getProjectById, con un parametro ID, para obtener un proyecto en específico.
- _Actualizar un proyecto:_ Se usará una función llamada updateProjectById, con un parametro ID, para actualizar los valores de un proyecto en específico.
- _Borrar un proyecto:_ Se usará una función llamada deleteProjectById, con un parametro ID, para borrar un proyecto en especifico.
- _Borrar todos los proyectos:_ Se usará una función llamada deleteAllProjects para borrar todos los proyectos.

### Contador de puntos

- Tendrá las funciones _plusPoint_ _minusPoint_, para aumentar/disminuir los puntos o vueltas.
- Tendrá una función _clearFields_ para resetear todos los valores.
