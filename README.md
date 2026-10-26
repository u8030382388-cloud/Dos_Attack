# DosBash

Script de Bash con fines **educativos** que simula un ataque de denegación de servicio (DoS) mediante el envío masivo de paquetes ICMP (ping) a un objetivo.

> ⚠️ **Aviso legal:** usar esta técnica contra equipos, redes o servicios que no te pertenecen o para los que no tienes autorización expresa por escrito es **ilegal** en la mayoría de países y puede acarrear responsabilidades civiles y penales. Úsalo únicamente en tu propia red, en un laboratorio aislado o en entornos de pruebas autorizados.

---

## Estructura del proyecto

```
Dos_Attack/
├── script.sh    # Script principal
└── README.md    # Explicación
```

---

## Qué hace el script

El script es muy corto (unas 20 líneas) y sigue esta secuencia:

1. **Limpia la pantalla** y espera un segundo.
2. **Instala dependencias** (`lolcat` y `figlet`) mediante `apt`.
3. **Muestra el banner** `DosBash` dibujado con `figlet` y coloreado con una secuencia ANSI, junto a la firma del autor.
4. **Actualiza el sistema** con `apt update && apt upgrade -y`.
5. **Pide al usuario** una página web o una IP objetivo.
6. **Ejecuta un ping continuo** contra ese objetivo:

   ```bash
   ping -c 9223372036854775807 $pagina
   ```

   El valor `9223372036854775807` es el entero máximo de 64 bits, por lo que en la práctica el ping **nunca termina**: se envían paquetes ICMP echo-request de forma indefinida.

---

## Requisitos

- Linux con **Bash** (probado en distribuciones basadas en Debian/Ubuntu).
- Conexión a Internet (para instalar paquetes).
- Privilegios de **sudo**.
- `pacman` disponible en el sistema.

La dependencia de `figlet` la instala el propio script, pero también puedes instalarlas antes a mano con:

```bash
sudo pacman -S --noconfirm figlet
```

---

## Cómo usarlo

1. **Da permisos de ejecución** al script (si no los tiene ya):

   ```bash
   chmod +x script.sh
   ```

2. **Ejecútalo** desde la carpeta del proyecto:

   ```bash
   ./script.sh
   ```

   Si prefieres no depender del bit de ejecución:

   ```bash
   bash script.sh
   ```

3. **Introduce el objetivo** cuando el script lo pida. Puedes escribir un dominio o una IP, por ejemplo:

   ```
   Introduce una página web o una IP objetivo:
   192.168.1.10
   ```

4. **Detener la ejecución:** pulsa `Ctrl + C`. El ping se lanzó en primer plano, así que esa combinación lo interrumpe y devuelve el control a la terminal.

---

## Ejemplo de ejecución

```console
$ ./script.sh
 ____            ____            _     
|  _ \  ___  ___| __ )  __ _ ___| |__  
| | | |/ _ \/ __|  _ \ / _` / __| '_ \ 
| |_| | (_) \__ \ |_) | (_| \__ \ | | |
|____/ \___/|___/____/ \__,_|___/_| |_|

By Elpíxel
-----------------------------------------------------------
Introduce una página web o una IP objetivo:
192.168.1.10
PING 192.168.1.10 (192.168.1.10) 56(84) bytes of data.
64 bytes from 192.168.1.10: icmp_seq=1 ttl=64 time=0.045 ms
64 bytes from 192.168.1.10: icmp_seq=2 ttl=64 time=0.051 ms
...
```

---

## Buenas prácticas para practicar

- Usa máquinas virtuales propias o plataformas diseñadas para ello (por ejemplo, laboratorios de pentesting aislados).
- Documenta la autorización antes de probar contra cualquier infraestructura.
- Si quieres profundizar de forma legal, estudia herramientas de *stress testing* pensadas para entornos controlados y con consentimiento.

---

## Autor

**Elpíxel**
