// Obtener el id del programa de la URL
const urlParams = new URLSearchParams(window.location.search);
// Obtener el id del programa de la URL
const idPrograma = urlParams.get("id");

// Función para formatear las fechas
function formatDate(dateString) {
  const date = new Date(dateString);
  const day = date.getDate().toString().padStart(2, "0");
  const month = (date.getMonth() + 1).toString().padStart(2, "0");
  const year = date.getFullYear();
  console.log("aaa", day, month, year);

  return `${day}/${month}/${year}`;
}

// Verificar si se tiene el id del programa
if (idPrograma) {
  // Realizar la petición AJAX para obtener los detalles del programa y la lista de estudiantes
  $.ajax({
    url: `./api/coordinador_gral/obtenerDetallesPrograma.php?id=${idPrograma}`, // Cambia esta URL a la correcta
    type: "GET",
    dataType: "json",
    success: function (data) {
      if (data.success) {
        const inicioPeriodo = formatDate(data.data.inicio_periodo);
        const finPeriodo = formatDate(data.data.fin_periodo);
        // Mostrar los detalles del programa
        $("#titulo-programa").text(
          `📌 Programa de Nivel: ${data.data.nivel} | 📅 Periodo: ${inicioPeriodo} - ${finPeriodo}`
        );

        $("#descripcion-programa").text(
          data.data.descripcion
            ? data.data.descripcion
            : "ℹ️ Descripción no disponible."
        );

        $("#nivel-programa").text(`🎓 Nivel académico: ${data.data.nivel}`);

        $("#educador_nombre").text(
          `👨‍🏫Educador responsable: ${data.data.nombre_coordinador} ${data.data.apellido_coordinador}`
        );

        // Crear la tabla de estudiantes
        if (data.data.estudiantes && data.data.estudiantes.length > 0) {
          let tableContent = `
                <table id="estudiantesTable" class="table table-striped">
                    <thead>
                        <tr>
                            <th>Nombre</th>
                            <th>Apellidos</th>
                            <th>CURP</th>
                            <th>Teléfono</th>
                            <th>Correo</th>
                            <th>Estado Solicitud</th> <!-- Nueva columna para el estado -->
                            <th>Opciones</th> <!-- Nueva columna para el estado -->
                        </tr>
                    </thead>
                    <tbody>
                `;

          // Agregar los estudiantes a la tabla
          // Agregar los estudiantes a la tabla
          data.data.estudiantes.forEach(function (estudiante) {
            // Buscar la solicitud del estudiante (suponiendo que solo haya una solicitud por estudiante)
            const solicitud = data.data.solicitudes.find(
              (solicitud) => solicitud.id_estudiante === estudiante.id
            );

            tableContent += `
    <tr>
        <td><p  class="text-decoration-none">${estudiante.nombre}</p></td>
        <td>${estudiante.apellidos} ${estudiante.apellido_materno}</td>
        <td>${estudiante.curp}</td>
        <td>${estudiante.telefono}</td>
        <td>${estudiante.correo || "N/A"}</td>
        <td>
            <form>
                <!-- Agregar el id_solicitud de la solicitud -->
                <input type="hidden" name="id_solicitud" value="${
                  solicitud ? solicitud.id : ""
                }"> 
                <label>
                    <input type="radio" name="estado_${
                      estudiante.id
                    }" value="pendiente" ${
              estudiante.status === "pendiente" ? "checked" : ""
            }>
                    Pendiente
                </label>
                <label>
                    <input type="radio" name="estado_${
                      estudiante.id
                    }" value="aprobado" ${
              estudiante.status === "aprobado" ? "checked" : ""
            }>
                    Aprobado
                </label>
                <label>
                    <input type="radio" name="estado_${
                      estudiante.id
                    }" value="desaprobado" ${
              estudiante.status === "desaprobado" ? "checked" : ""
            }>
                    Desaprobado
                </label>
            </form>
        </td>

    <td> 
    <!-- Botón de eliminar -->
<button class="btn-eliminar" data-id-solicitud="${
              solicitud ? solicitud.id : ""
            }">
    Eliminar
</button>

 <button class="btn-editar" 
    data-id-estudiante="${estudiante.id}"
    data-nombre="${estudiante.nombre}"
    data-apellidos="${estudiante.apellidos}"
    data-apellido_materno="${estudiante.apellido_materno}"
    data-vialidad_tipo	="${estudiante.vialidad_tipo}"
    data-vialidad_nombre	="${estudiante.vialidad_nombre}"
    data-num_exterior	="${estudiante.num_exterior}"
    data-curp="${estudiante.curp}"
    data-telefono="${estudiante.telefono}"
    data-correo="${estudiante.correo}">
<i class="fas fa-edit"></i> Editar
</button>
    </td>
    </tr>
`;
          });

          tableContent += "</tbody></table>";
          $("#detallesPrograma").append(tableContent);

          // Inicializar DataTable sobre la tabla de estudiantes
          $("#estudiantesTable").DataTable({
            paging: true,
            searching: true,
            ordering: true,
            info: true,
            lengthChange: true, // Permitir seleccionar cantidad de registros por página
            language: {
              search: "Buscar:",
              lengthMenu: "Mostrar _MENU_ registros por página",
              info: "Mostrando de _START_ a _END_ de _TOTAL_ registros",
              infoEmpty: "Mostrando 0 a 0 de 0 registros",
              infoFiltered: "(filtrado de _MAX_ registros en total)",
              paginate: {
                first: "Primero",
                previous: "Anterior",
                next: "Siguiente",
                last: "Último",
              },
            },
          });
        } else {
          $("#detallesPrograma").append(
            "<p>No hay estudiantes registrados para este programa.</p>"
          );
        }
      } else {
        alert(
          data.message || "Hubo un error al obtener los detalles del programa."
        );
      }
    },
    error: function (error) {
      console.log("Error al obtener los detalles del programa:", error);
    },
  });
} else {
  console.log("No se encontró el id del programa en la URL");
}

// Función para eliminar la solicitud (simulada)
function eliminarSolicitud(idSolicitud) {
  // Aquí puedes hacer una petición AJAX para eliminar la solicitud
  $.ajax({
    url: "./api/eliminarSolicitud.php", // Ruta al endpoint de eliminación
    type: "POST",
    data: {
      id_solicitud: idSolicitud,
    },
    dataType: "json",
    success: function (response) {
      if (response.success) {
        // Mostrar mensaje de éxito
        Swal.fire({
          title: "¡Eliminado!",
          text: "La solicitud ha sido eliminada.",
          icon: "success",
          confirmButtonText: "Aceptar",
        }).then(() => {
          // Recargar la página o actualizar la tabla
          location.reload(); // O actualizar la tabla dinámicamente
        });
      } else {
        // Mostrar mensaje de error
        Swal.fire({
          title: "Error",
          text: response.message || "Hubo un error al eliminar la solicitud.",
          icon: "error",
          confirmButtonText: "Aceptar",
        });
      }
    },
    error: function (error) {
      // Manejar errores de la petición AJAX
      Swal.fire({
        title: "Error",
        text: "Hubo un error al conectar con el servidor.",
        icon: "error",
        confirmButtonText: "Aceptar",
      });
    },
  });
}

$(document).on("click", ".btn-eliminar", function () {
  // Obtener el ID de la solicitud desde el atributo data
  const idSolicitud = $(this).data("id-solicitud");

  // Mostrar confirmación con SweetAlert
  Swal.fire({
    title: "¿Estás seguro?",
    text: "¡No podrás revertir esta acción!",
    icon: "warning",
    showCancelButton: true,
    confirmButtonColor: "#d33",
    cancelButtonColor: "#3085d6",
    confirmButtonText: "Sí, eliminar",
    cancelButtonText: "Cancelar",
  }).then((result) => {
    if (result.isConfirmed) {
      // Si el usuario confirma, realizar la eliminación
      eliminarSolicitud(idSolicitud);
    }
  });
});

// Función para actualizar la solicitud
function actualizarSolicitud(idSolicitud, datos) {
  console.log("datos en met", datos);
  $.ajax({
    url: "./api/actualizarSolicitud.php",
    type: "POST",
    data: {
      id_solicitud: idSolicitud,
      nombre: datos.nombre,
      apellidos: datos.apellidos,
      apellido_materno: datos.apellido_materno,
      nuevoVialidadTipo: datos.nuevoVialidadTipo,
      nuevoVialidadNombre: datos.nuevoVialidadNombre,
      nuevoNumExterior: datos.nuevoNumExterior,
      curp: datos.curp,
      telefono: datos.telefono,
      correo: datos.correo,
    },
    dataType: "json",
    success: function (response) {
      if (response.success) {
        Swal.fire({
          title: "¡Actualizado!",
          text: "La solicitud ha sido actualizada correctamente.",
          icon: "success",
          confirmButtonText: "Aceptar",
        }).then(() => {
          location.reload();
        });
      } else {
        Swal.fire({
          title: "Error",
          text: response.message || "Hubo un error al actualizar la solicitud.",
          icon: "error",
          confirmButtonText: "Aceptar",
        });
      }
    },
    error: function () {
      Swal.fire({
        title: "Error",
        text: "Hubo un error al conectar con el servidor.",
        icon: "error",
        confirmButtonText: "Aceptar",
      });
    },
  });
}

/* $(document).on("click", ".btn-editar", function () {
  // Obtener los datos del estudiante desde los atributos data
  const idEstudiante = $(this).data("id-estudiante");
  const nombre = $(this).data("nombre");
  const apellidos = $(this).data("apellidos");
  const apellido_materno = $(this).data("apellido_materno");
  const vialidad_tipo = $(this).data("vialidad_tipo");
  const vialidad_nombre = $(this).data("vialidad_nombre");
  const num_exterior = $(this).data("num_exterior");
  const curp = $(this).data("curp");
  const telefono = $(this).data("telefono");
  const correo = $(this).data("correo");

  Swal.fire({
    title: "Editar Estudianteee",
    html: `
    <form id="form-editar-estudiante" class="swal-form">
      <div class="form-group">
        <label for="nombre">Nombre:</label>
        <input type="text" id="nombre" class="form-control" value="${nombre}" required>
      </div>
      <div class="form-group">
        <label for="apellidos">Apellido Paterno:</label>
        <input type="text" id="apellidos" class="form-control" value="${apellidos}" required>
      </div>
      <div class="form-group">
        <label for="apellido_materno">Apellido Materno:</label>
        <input type="text" id="apellido_materno" class="form-control" value="${apellido_materno}" required>
      </div>
      <div class="form-group">
        <label for="vialidad_tipo">Tipo de Vialidad:</label>
        <input type="text" id="vialidad_tipo" class="form-control" value="${vialidad_tipo}" required>
      </div>
      <div class="form-group">
        <label for="vialidad_nombre">Nombre de la Vialidad:</label>
        <input type="text" id="vialidad_nombre" class="form-control" value="${vialidad_nombre}" required>
      </div>
      <div class="form-group">
        <label for="num_exterior">Número Exterior:</label>
        <input type="text" id="num_exterior" class="form-control" value="${num_exterior}" required>
      </div>
      <div class="form-group">
        <label for="curp">CURP:</label>
        <input type="text" id="curp" class="form-control" value="${curp}" required>
      </div>
      <div class="form-group">
        <label for="telefono">Teléfono:</label>
        <input type="text" id="telefono" class="form-control" value="${telefono}" required>
      </div>
      <div class="form-group">
        <label for="correo">Correo: 
          <span class="tooltip" title="Este campo es opcional.">📩</span>
        </label>
        <input type="email" id="correo" class="form-control" value="${correo}" placeholder="Ejemplo: usuario@email.com">
      </div>
    </form>
  `,
    showCancelButton: true,
    confirmButtonText: "Guardar",
    cancelButtonText: "Cancelar",
    preConfirm: () => {
      return {
        idEstudiante,
        nombre: $("#nombre").val(),
        apellidos: $("#apellidos").val(),
        apellido_materno: $("#apellido_materno").val(),
        vialidad_tipo: $("#vialidad_tipo").val(),
        vialidad_nombre: $("#vialidad_nombre").val(),
        num_exterior: $("#num_exterior").val(),
        curp: $("#curp").val(),
        telefono: $("#telefono").val(),
        correo: $("#correo").val(),
      };
    },
  }).then((result) => {
    if (result.isConfirmed) {
      const datos = result.value;
      actualizarSolicitud(datos.idEstudiante, datos);
    }
  });
}); */

$(document).on("click", ".btn-editar", function () {
  // Obtener los datos del estudiante desde los atributos data
  const idEstudiante = $(this).data("id-estudiante");
  const nombre = $(this).data("nombre");
  const apellidos = $(this).data("apellidos");
  const apellido_materno = $(this).data("apellido_materno");
  const vialidad_tipo = $(this).data("vialidad_tipo");
  const vialidad_nombre = $(this).data("vialidad_nombre");
  const num_exterior = $(this).data("num_exterior");
  const curp = $(this).data("curp");
  const telefono = $(this).data("telefono");
  const correo = $(this).data("correo");

  // Mostrar un modal con el formulario de edición
  Swal.fire({
    title: "Editar Estudiante",
    html: `
       <form id="form-editar-estudiante">
    <!-- Campo: Nombre -->
    <div class="form-group">
        <label for="nombre">Nombre:</label>
        <input type="text" id="nombre" class="form-control" value="${nombre}" placeholder="Ingresa tu nombre" required>
        <span class="tooltip">El nombre debe contener solo letras y espacios.</span>
    </div>

    <!-- Campo: Apellido Paterno -->
    <div class="form-group">
        <label for="apellidos">Apellido Paterno:</label>
        <input type="text" id="apellidos" class="form-control" value="${apellidos}" placeholder="Ingresa tu apellido paterno" required>
        <span class="tooltip">El apellido paterno debe contener solo letras.</span>
    </div>

    <!-- Campo: Apellido Materno -->
    <div class="form-group">
        <label for="apellido_materno">Apellido Materno:</label>
        <input type="text" id="apellido_materno" class="form-control" value="${apellido_materno}" placeholder="Ingresa tu apellido materno" required>
        <span class="tooltip">El apellido materno debe contener solo letras.</span>
    </div>

    <!-- Campo: Tipo de Vialidad -->
    <div class="form-group">
        <label for="vialidad_tipo">Tipo de Vialidad:</label>
        <input type="text" id="vialidad_tipo" class="form-control" value="${vialidad_tipo}" placeholder="Ej: Calle, Avenida, Boulevard" required>
        <span class="tooltip">Ingresa el tipo de vialidad (ej: Calle, Avenida).</span>
    </div>

    <!-- Campo: Nombre de la Vialidad -->
    <div class="form-group">
        <label for="vialidad_nombre">Nombre de la Vialidad:</label>
        <input type="text" id="vialidad_nombre" class="form-control" value="${vialidad_nombre}" placeholder="Ej: Juárez, Reforma" required>
        <span class="tooltip">Ingresa el nombre de la vialidad.</span>
    </div>

    <!-- Campo: Número Exterior -->
    <div class="form-group">
        <label for="num_exterior">Número Exterior:</label>
        <input type="text" id="num_exterior" class="form-control" value="${num_exterior}" placeholder="Ej: 123" required>
        <span class="tooltip">Ingresa el número exterior de tu domicilio.</span>
    </div>

    <!-- Campo: CURP -->
    <div class="form-group">
        <label for="curp">CURP:</label>
        <input type="text" id="curp" class="form-control" value="${curp}" placeholder="Ingresa tu CURP" required maxlength="18">
        <span class="tooltip">La CURP debe tener 18 caracteres alfanuméricos.</span>
    </div>

    <!-- Campo: Teléfono -->
    <div class="form-group">
        <label for="telefono">Teléfono:</label>
        <input type="tel" id="telefono" class="form-control" value="${telefono}" placeholder="Ej: 5512345678" required pattern="[0-9]{10}">
        <span class="tooltip">Ingresa un número de teléfono válido de 10 dígitos.</span>
    </div>

    <!-- Campo: Correo (Opcional) -->
    <div class="form-group">
        <label for="correo">Correo:</label>
        <input type="email" id="correo" class="form-control" value="${correo}" placeholder="Ej: usuario@dominio.com">
        <span class="tooltip">Ingresa un correo electrónico válido (opcional).</span>
    </div>
</form>
    `,
    showCancelButton: true,
    confirmButtonText: "Guardar",
    cancelButtonText: "Cancelar",
    preConfirm: () => {
      // Obtener los valores del formulario
      const nuevoNombre = $("#nombre").val();
      const nuevoApellidos = $("#apellidos").val();
      const apellido_materno = $("#apellido_materno").val();
      const nuevoVialidadTipo = $("#vialidad_tipo").val();
      const nuevoVialidadNombre = $("#vialidad_nombre").val();
      const nuevoNumExterior = $("#num_exterior").val();
      const nuevoCurp = $("#curp").val();
      const nuevoTelefono = $("#telefono").val();
      const nuevoCorreo = $("#correo").val();

      // Validar que los campos obligatorios estén llenos
      if (
        !nuevoVialidadTipo ||
        !nuevoVialidadNombre ||
        !nuevoNumExterior ||
        !nuevoCurp ||
        !nuevoTelefono
      ) {
        Swal.showValidationMessage(
          "Todos los campos obligatorios deben estar llenos."
        );
        return false;
      }

      // Retornar los datos para la petición AJAX
      return {
        idEstudiante,
        nombre: nuevoNombre,
        apellidos: nuevoApellidos,
        apellido_materno: apellido_materno,
        nuevoVialidadTipo: nuevoVialidadTipo,
        nuevoVialidadNombre: nuevoVialidadNombre,
        nuevoNumExterior: nuevoNumExterior,
        curp: nuevoCurp,
        telefono: nuevoTelefono,
        correo: nuevoCorreo,
      };
    },
  }).then((result) => {
    if (result.isConfirmed) {
      // Obtener los datos del formulario
      const {
        idEstudiante,
        nombre,
        apellidos,
        apellido_materno,
        nuevoVialidadTipo,
        nuevoVialidadNombre,
        nuevoNumExterior,
        curp,
        telefono,
        correo,
      } = result.value;
      console.log(
        "datos a enviar: ",
        nombre,
        apellidos,
        apellido_materno,
        nuevoVialidadTipo,
        nuevoVialidadNombre,
        nuevoNumExterior,
        curp,
        telefono,
        correo
      );

      // Enviar la petición AJAX para actualizar el estudiante
      actualizarSolicitud(idEstudiante, {
        nombre,
        apellidos,
        apellido_materno,
        nuevoVialidadTipo,
        nuevoVialidadNombre,
        nuevoNumExterior,
        curp,
        telefono,
        correo,
      });
    }
  });
});

$(document).on("change", 'input[type="radio"]', function () {
  // Obtener el ID del estudiante del atributo name
  const nameAttr = $(this).attr("name");
  const studentId = nameAttr.split("_")[1]; // Supone que el formato es "estado_ID"

  // Obtener el valor seleccionado
  const newStatus = $(this).val();

  // Obtener el id de la solicitud desde el campo oculto
  const solicitudId = $(this)
    .closest("form")
    .find('input[name="id_solicitud"]')
    .val();

  // Enviar la petición AJAX
  $.ajax({
    url: "./api/actualizarEstadoSolicitud.php", // Cambia a la URL correcta de tu API
    type: "POST",
    data: {
      id_solicitud: solicitudId, // Enviar el id de la solicitud
      estado: newStatus, // Nuevo estado seleccionado
    },
    dataType: "json",
    success: function (response) {
      if (response.success) {
        // Mostrar notificación de éxito usando SweetAlert2 (Toast)
        Swal.fire({
          icon: "success",
          title: "Estado actualizado correctamente.",
          toast: true,
          position: "top-end",
          showConfirmButton: false,
          timer: 3000, // Duración del toast
          timerProgressBar: true,
        });
      } else {
        // Mostrar notificación de error usando SweetAlert2 (Toast)
        Swal.fire({
          icon: "error",
          title: "Error al actualizar el estado.",
          text: response.message || "Inténtalo nuevamente.",
          toast: true,
          position: "top-end",
          showConfirmButton: false,
          timer: 3000, // Duración del toast
          timerProgressBar: true,
        });
      }
    },
    error: function (error) {
      console.error("Error en la petición:", error);
      // Notificación de error al fallar la petición AJAX
      Swal.fire({
        icon: "error",
        title: "Hubo un problema al actualizar el estado.",
        toast: true,
        position: "top-end",
        showConfirmButton: false,
        timer: 3000, // Duración del toast
        timerProgressBar: true,
      });
    },
  });
});
