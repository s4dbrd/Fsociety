# Fsociety

Proyecto creado en bash, cuya principal función es permitir la instalación de la paquetería de Kali Linux en sistemas basados en Debian.

Para el funcionamiento del script, será necesario asignar permisos de ejecución y ejecutarlo como **sudo** si se quiere configurar la paquetería.
```bash
chmod +x fsociety.sh
sudo ./fsociety.sh
```

A su vez, el script contiene otras herramientas, tales como:
* **Enumeración del Sistema**: Permitiendo así, ver las principales características del equipo (usuarios, crontabs, ficheros con permisos de escritura...), pudiendose ver, si nuestro sistema puede ser vulnerado fácilmente.

* **Crackeo de Contraseñas**: A través de la herramienta `john the ripper` se permite el uso de crackear una contraseña hasheada asignándole el tipo de encriptación que tiene, para más información acerca de la herramienta: [john](https://tools.kali.org/password-attacks/john)
