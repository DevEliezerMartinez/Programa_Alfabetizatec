$(document).ready(function () {
  // Formulario dinámico de educador
  // Mostrar campos adicionales si se selecciona "Estudianteeeee"
  $("#tipo_participante").change(function () {
    if ($(this).val() === "estudiante") {
      $("#grupo_numero_control").show();
      $("#grupo_carrera").show();
      $("#grupo_semestre").show();
    } else {
      $("#grupo_numero_control").hide();
      $("#grupo_carrera").hide();
      $("#grupo_semestre").hide();
    }
  });

  // Asegurar que los campos estén ocultos al cargar la página si no es "estudiante"
  if ($("#tipo_participante").val() !== "estudiante") {
    $("#grupo_numero_control").hide();
    $("#grupo_carrera").hide();
    $("#grupo_semestre").hide();
  }
  // Fin de formulario educador

  // Mostrar modales al hacer clic en los botones correspondientes
  $(".btn_submit_programa").click(function () {
    $("#modal_programa").fadeIn();
  });

  $(".btn_submit_educador").click(function () {
    $("#modal_educador").fadeIn();
  });

  $(".btn_submit_estudiante").click(function () {
    $("#modal_estudiante").fadeIn();
  });

  // Cerrar los modales cuando se haga clic en el botón de cierre
  $(".close").click(function () {
    $(this).closest(".modal").fadeOut();
  });

  // Cerrar el modal si se hace clic fuera de él
  $(window).click(function (event) {
    if ($(event.target).is(".modal")) {
      $(".modal").fadeOut();
    }
  });

  // Procesar formularios de los modales (sin recargar la página)
  // Modal programa
  $("#registrationFormPrograma").submit(function (event) {
    event.preventDefault();
    $("#modal_programa").fadeOut();
  });

  // Modal educador
  $("#registrationFormEducador").submit(function (event) {
    event.preventDefault();
    $("#modal_educador").fadeOut();
  });

  // Modal estudiante
  $("#registrationFormEstudiante").submit(function (event) {
    // Prevenir el comportamiento por defecto del formulario (recarga de página)
    event.preventDefault();

    // Llamar a la función para enviar el formulario
    enviarFormularioEstudiante();

    // Cerrar el modal después de enviar el formulario
    $("#modal_estudiante").fadeOut();
  });
  // Envío de formulario de educador con AJAX
  $("#registrationFormEducador").submit(function (e) {
    e.preventDefault();

    var formData = new FormData(this);
    let retryCount = 0;
    const maxRetries = 3;
    const retryDelay = 3000;

    function generatePDF(formData) {
      const { jsPDF } = window.jspdf;
      const doc = new jsPDF();

      // **Encabezado**
      doc.setFont("helvetica", "bold");
      doc.setFontSize(16);
      doc.text("TecNM-San Marcos    Registro de Educador", 10, 15);
      doc.setFontSize(12);
      doc.text("Fecha: " + new Date().toLocaleDateString(), 140, 15);

      // **Dibujar línea divisoria**
      doc.setLineWidth(0.5);
      doc.line(10, 20, 200, 20);

      // **Sección de datos**
      let y = 30;
      doc.setFontSize(14);
      
      formData.forEach((value, key) => {
        doc.setFont("helvetica", "bold");
        doc.text(`${key.padEnd(25, " ")}:`, 10, y); // Etiqueta alineada
        doc.setFont("helvetica", "normal");
        doc.text(value.toString(), 70, y); // Valor con más espacio
        y += 12; // Espacio extra entre filas
      });

      // **Guardar PDF**
      doc.save("registro_educador.pdf");
    }

    function sendRequest() {
      $.ajax({
        url: "./api/addEducador.php",
        type: "POST",
        data: formData,
        processData: false,
        contentType: false,
        timeout: 10000,
        dataType: "json",
        beforeSend: function () {
          Swal.fire({
            title: "Enviando...",
            text: "Por favor, espere.",
            allowOutsideClick: false,
            didOpen: () => {
              Swal.showLoading();
            },
          });
        },
        success: function (response) {
          if (typeof response === "object" && response !== null) {
            if (!response.success) {
              Swal.fire({
                title: "Error",
                text: response.message,
                icon: "error",
                confirmButtonText: "Aceptar",
              });
              console.error("Detalles del error:", response.details);
              return;
            }

            Swal.fire({
              title: "¡Éxito!",
              text: response.message,
              icon: "success",
              showCancelButton: true,
              confirmButtonText: "Aceptar",
              cancelButtonText: "Descargar PDF",
              showCloseButton: true,
            }).then((result) => {
              if (result.isConfirmed) {
                document.getElementById("registrationFormEducador").reset();
                obtenerEducadores();
              } else if (result.dismiss === Swal.DismissReason.cancel) {
                generatePDF(formData);
              }
            });
          } else {
            console.error("Respuesta del servidor no es un JSON válido:", response);
            Swal.fire({
              title: "Error",
              text: "Respuesta del servidor inválida.",
              icon: "error",
              confirmButtonText: "Aceptar",
            });
          }
        },
        error: function (xhr, status, error) {
          if (status === "timeout" || status === "error") {
            if (retryCount < maxRetries) {
              retryCount++;
              Swal.fire({
                title: "Error de red",
                text: `Reintentando en ${retryDelay / 1000} segundos... (Intento ${retryCount} de ${maxRetries})`,
                icon: "warning",
                allowOutsideClick: false,
                didOpen: () => {
                  Swal.showLoading();
                },
              });
              setTimeout(sendRequest, retryDelay);
            } else {
              Swal.fire({
                title: "Error de red",
                text: "No se pudo conectar al servidor. Por favor, inténtelo de nuevo más tarde.",
                icon: "error",
                confirmButtonText: "Aceptar",
              });
            }
          } else {
            Swal.fire({
              title: "Error",
              text: "Hubo un problema al procesar la solicitud.",
              icon: "error",
              confirmButtonText: "Aceptar",
            });
            console.error("Error en la solicitud AJAX:", xhr.responseText);
          }
        },
      });
    }

    sendRequest();
  });
});

//envio de estudiante:
function enviarFormularioEstudiante() {
  // Crear un objeto con los datos del formulario
  const formData = {};

  // Obtener los valores del formulario usando los 'name' de los inputs
  $("#registrationFormEstudiante")
    .find("input, select") // Incluye también los elementos <select>
    .each(function () {
      const name = $(this).attr("name"); // Obtiene el 'name' del elemento
      const value = $(this).val(); // Obtiene el valor del elemento
      formData[name] = value; // Almacena en el objeto formData
    });

  let retryCount = 0;
  const maxRetries = 3;
  const retryDelay = 3000;

  function generatePDF(formData) {
    const { jsPDF } = window.jspdf;
    const doc = new jsPDF();

    // **Encabezado**
    doc.setFont("helvetica", "bold");
    doc.setFontSize(16);
    doc.text("TecNM-San Marcos    Registro de Estudiante", 10, 15);
    doc.setFontSize(12);
    doc.text("Fecha: " + new Date().toLocaleDateString(), 140, 15);

    // **Dibujar línea divisoria**
    doc.setLineWidth(0.5);
    doc.line(10, 20, 200, 20);

    // **Sección de datos**
    let y = 30;
    doc.setFontSize(14);

    // Mostrar los datos del formulario en el PDF
    Object.keys(formData).forEach((key) => {
      doc.setFont("helvetica", "bold");
      doc.text(`${key.padEnd(25, " ")}:`, 10, y); // Etiqueta alineada
      doc.setFont("helvetica", "normal");
      doc.text(formData[key], 85, y); // Valor con más espacio
      y += 12; // Espacio extra entre filas
    });

    // **Guardar PDF**
    doc.save("registro_estudiante.pdf");
  }

  function sendRequest() {
    // Mostrar alerta antes de enviar (usando SweetAlert)
    Swal.fire({
      title: "Enviando formulario...",
      text: "Por favor espera mientras enviamos los datos.",
      icon: "info",
      showConfirmButton: false,
      willOpen: () => {
        Swal.showLoading(); // Muestra el cargando mientras se espera la respuesta
      },
    });

    // Realizar la petición AJAX con datos en formato JSON
    $.ajax({
      url: "./api/addEstudiante.php", // Cambia esta URL por la ruta correcta en tu servidor
      type: "POST",
      contentType: "application/json", // Indicamos que el contenido será en formato JSON
      data: JSON.stringify(formData), // Convertimos el objeto formData en JSON
      timeout: 10000,
      dataType: "json",
      success: function (response) {
        if (typeof response === "object" && response !== null) {
          if (!response.success) {
            Swal.fire({
              title: "Error",
              text: response.message,
              icon: "error",
              confirmButtonText: "Aceptar",
            });
            console.error("Detalles del error:", response.details);
            return;
          }

          Swal.fire({
            title: "¡Éxito!",
            text: response.message,
            icon: "success",
            showCancelButton: true,
            confirmButtonText: "Aceptar",
            cancelButtonText: "Descargar PDF",
            showCloseButton: true,
          }).then((result) => {
            if (result.isConfirmed) {
              document.getElementById("registrationFormEstudiante").reset();
              obtenerEstudiantes();
            } else if (result.dismiss === Swal.DismissReason.cancel) {
              generatePDF(formData); // Generar y descargar el PDF con los datos
            }
          });
        } else {
          console.error("Respuesta del servidor no es un JSON válido:", response);
          Swal.fire({
            title: "Error",
            text: "Respuesta del servidor inválida.",
            icon: "error",
            confirmButtonText: "Aceptar",
          });
        }
      },
      error: function (xhr, status, error) {
        if (status === "timeout" || status === "error") {
          if (retryCount < maxRetries) {
            retryCount++;
            Swal.fire({
              title: "Error de red",
              text: `Reintentando en ${retryDelay / 1000} segundos... (Intento ${retryCount} de ${maxRetries})`,
              icon: "warning",
              allowOutsideClick: false,
              didOpen: () => {
                Swal.showLoading();
              },
            });
            setTimeout(sendRequest, retryDelay);
          } else {
            Swal.fire({
              title: "Error de red",
              text: "No se pudo conectar al servidor. Por favor, inténtelo de nuevo más tarde.",
              icon: "error",
              confirmButtonText: "Aceptar",
            });
          }
        } else {
          Swal.fire({
            title: "Error",
            text: "Hubo un problema al procesar la solicitud.",
            icon: "error",
            confirmButtonText: "Aceptar",
          });
          console.error("Error en la solicitud AJAX:", xhr.responseText);
        }
      },
    });
  }

  sendRequest(); // Iniciar el envío de la solicitud
}


// Código adicional para manejar formularios con "fetch" y carga de educadores

document.addEventListener("DOMContentLoaded", () => {
  const form = document.getElementById("registrationForm");
  const modal = document.getElementById("modal_programa");
  const closeModal = document.querySelector(".close");

  // Cerrar el modal cuando se hace clic en el botón de cierre
  closeModal.addEventListener("click", () => {
    modal.style.display = "none";
  });

  // Enviar formulario usando fetch (AJAX)
  form.addEventListener("submit", async (event) => {
    event.preventDefault(); // Evita el comportamiento predeterminado

    const formData = new FormData(form); // Recoge los datos del formulario

    // Convertir FormData a objeto simple
    const data = {
      educador: formData.get("educador"),
      id_nivel: formData.getAll("id_nivel[]"), // Obtener todos los niveles seleccionados
      inicio_periodo: formData.get("inicio_periodo"),
      fin_periodo: formData.get("fin_periodo"),
      metas: {},
    };

    // Obtener metas por cada nivel seleccionado
    data.id_nivel.forEach((nivelId) => {
      const metaInput = document.getElementById(`meta_${nivelId}`);
      if (metaInput) {
        data.metas[nivelId] = metaInput.value;
      }
    });

    try {
      const response = await fetch("./api/addPrograma.php", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(data), // Enviar como JSON
      });

      if (response.ok) {
        const result = await response.json();

        Swal.fire({
          icon: "success",
          title: "¡Éxito!",
          text: `${result.message}`,
          showConfirmButton: true,
        });

        form.reset(); // Limpiar formulario
        modal.style.display = "none"; // Cerrar modal
        obtenerProgramas();
      } else {
        const error = await response.json();
        Swal.fire({
          icon: "error",
          title: "Error",
          text: `Error al enviar el formulario: ${
            error.message || "Algo salió mal"
          }`,
          showConfirmButton: true,
        });
      }
    } catch (error) {
      // Manejar errores imprevistos
      Swal.fire({
        icon: "error",
        title: "Error inesperado",
        text: "Ocurrió un problema al enviar el formulario. Por favor, inténtalo de nuevo más tarde.",
        showConfirmButton: true,
      });
    }
  });
});

$("#programa_estudiante").on("change", function () {
  const selectedValue = $(this).val();
  console.log("Programa seleccionado:", selectedValue); // Para depurar
});

// Función para obtener los programas del Tecnológico
function obtenerProgramas() {
  // Obtener el ID del instituto desde localStorage
  const idInstituto = localStorage.getItem("tecnologico_id");

  // Verificar si el ID está disponible
  if (!idInstituto) {
    $("#Programas_tec").html(
      "<p>Error: No se encontró el ID del instituto.</p>"
    );
    console.error("ID del instituto no encontrado en localStorage.");
    return;
  }

  // Mostramos un mensaje mientras esperamos la respuesta
  $("#Programas_tec").html("<p>Cargando programas...</p>");

  function formatDate(dateString) {
    const date = new Date(dateString); // Convertir la cadena de fecha a un objeto Date
    const month = date.getMonth() + 1; // getMonth() devuelve un índice basado en 0, por lo que sumamos 1
    const year = date.getFullYear().toString().slice(-2); // Obtener los últimos 2 dígitos del año
    return `${month}/${year}`; // Devolver el formato mes/año
  }

  // Realizar la solicitud AJAX
  $.ajax({
    url: "./api/getProgramas.php", // Ruta al endpoint que devuelve los programas
    type: "GET", // Usamos GET para obtener los datos
    data: { id_instituto: idInstituto }, // Enviamos el id del instituto como parámetro
    success: function (response) {
      try {
        // Verificar que la respuesta tenga el formato esperado
        if (response.success && response.data.length > 0) {
          let tableHTML = `
              <table id="tablaProgramas" class="display" style="width:100%">
                <thead>
                  <tr>
                  <th> Nivel</th>
                  <th>Educador</th>
                  <th>Meta</th>
                  <th>Inicio Periodo</th>
                  <th>Fin Periodo</th>
                  <th>Opciones</th>
                  </tr>
                </thead>
                <tbody>
            `;

          let selectOptionsHTML =
            '<option value="">Selecciona un programa</option>'; // Opción por defecto

          response.data.forEach((programa) => {
            // Agregar filas a la tabla
            tableHTML += `
                <tr>
                 

                  <td>${programa.nivel_nombre}</td>
                  <td>${programa.coordinador_nombre}</td>
                  <td>${programa.meta}</td>
                  <td>${programa.inicio_periodo}</td>
                  <td>${programa.fin_periodo}</td>
                  <td>
    <a href="detalles_programa.php?id=${programa.id}">Detalles</a>
</td>
                </tr>
              `;

            // Agregar opciones al select
            selectOptionsHTML += `
    <option value="${programa.id}">
         ${programa.nivel_nombre.substring(0, 5)} - ${
              programa.coordinador_nombre
            } ${formatDate(programa.inicio_periodo)} - ${formatDate(
              programa.fin_periodo
            )}
    </option>
`;
          });

          tableHTML += `</tbody></table>`;

          // Insertar la tabla en el contenedor
          $("#Programas_tec").html(tableHTML);

          // Insertar las opciones en el select
          $("#programa_estudiante").html(selectOptionsHTML);

          // Inicializar DataTable
          $("#tablaProgramas").DataTable({
            paging: true,
            searching: true,
            ordering: true,
            order: [[1, "asc"]], // Ordenar por la columna 'Educador' (índice 1) de manera ascendente
          });
        } else {
          // Si no hay programas, mostramos un mensaje adecuado
          $("#Programas_tec").html("<p>No se encontraron programas.</p>");
        }
      } catch (error) {
        // Si hubo un error al procesar la respuesta
        console.error("Error al procesar los datos:", error);
        $("#Programas_tec").html("<p>Error al procesar los programas.</p>");
      }
    },
    error: function (xhr, status, error) {
      // En caso de error con la solicitud AJAX
      console.error("Error en la solicitud:", error);
      $("#Programas_tec").html(
        "<p>Hubo un problema al obtener los programas.</p>"
      );
    },
  });
}

function obtenerEstudiantes() {
  const idInstituto = localStorage.getItem("tecnologico_id");

  if (!idInstituto) {
    $("#Estudiantes").html("<p>Error: No se encontró el ID del instituto.</p>");
    console.error("ID del instituto no encontrado en localStorage.");
    return;
  }

  $("#Estudiantes").html("<p>Cargando estudiantes...</p>");

  $.ajax({
    url: "./api/getEstudiantes.php",
    type: "GET",
    data: { id_instituto: idInstituto },
    success: function (response) {
      if (response.success && response.data.length > 0) {
        let tableHTML = `
            <table id="tablaEstudiantes" class="display" style="width:100%">
              <thead>
                <tr>
                  <th>Nombre</th>
                  <th>Apellidos</th>
                  <th>Domicilio</th>
                  <th>CURP</th>
                  <th>Teléfono</th>
                  <th>Correo</th>
                </tr>
              </thead>
              <tbody>
          `;

        response.data.forEach((estudiante) => {
          tableHTML += `
              <tr>
                <td>${estudiante.nombre}</td>
                <td>${estudiante.apellidos}</td>
                <td>${estudiante.domicilio}</td>
                <td>${estudiante.curp}</td>
                <td>${estudiante.telefono}</td>
                <td>${estudiante.correo}</td>
              </tr>
            `;
        });

        tableHTML += `
              </tbody>
            </table>
          `;

        /*  $("#Estudiantes_tec").html(tableHTML); */

        $("#tablaEstudiantes").DataTable({
          paging: true,
          searching: true,
          ordering: true,
        });
      } else {
        $("#Estudiantes_tec").html("<p>No se encontraron estudiantes.</p>");
      }
    },
    error: function (xhr, status, error) {
      console.error("Error en la solicitud:", error);
      $("#Estudiantes_tec").html(
        "<p>Hubo un problema al obtener los estudiantes.</p>"
      );
    },
  });
}

function obtenerEducadores() {
  const idInstituto = localStorage.getItem("tecnologico_id");

  if (!idInstituto) {
    $("#Educadores_tec").html(
      "<p>Error: No se encontró el ID del instituto.</p>"
    );
    console.error("ID del instituto no encontrado en localStorage.");
    return;
  }

  // Mostrar mensaje mientras se carga la información
  $("#Educadores_tec").html("<p>Cargando educadores...</p>");

  $.ajax({
    url: "./api/getEducadores.php", // Ajusta la ruta de la API
    type: "GET",
    data: { id_tecnologico: idInstituto },
    success: function (response) {
      try {
        if (response.status && response.data.length > 0) {
          // Crear las opciones para el select
          let optionsHTML = '<option value="">Selecciona un educador</option>';
          response.data.forEach((educador) => {
            optionsHTML += `
                <option value="${educador.id}">${educador.nombre} ${educador.apellido}</option>
              `;
          });

          // Actualizar el select con las nuevas opciones
          $("#educadorSelect").empty().html(optionsHTML);

          // Crear la tabla con los datos de los educadores
          let tableHTML = `
              <table id="tablaEducadores" class="display" style="width:100%">
                <thead>
                  <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Email</th>
                    <th>Teléfono</th>
                    <th>Modalidad</th>
                    <th>Tipo</th>
                  </tr>
                </thead>
                <tbody>
            `;

          response.data.forEach((educador) => {
            tableHTML += `
                <tr>
                  <td>${educador.id}</td>
                  <td>  <a href="detalles_educador.php?id=${educador.id}">${educador.nombre} ${educador.apellido}</a> </td>
                  <td>${educador.correo}</td>
                  <td>${educador.telefono}</td>
                  <td>${educador.tipo_participante}</td>
                  <td>${educador.modalidad}</td>
                </tr>
              `;
          });

          tableHTML += `
                </tbody>
              </table>
            `;

          // Actualizar el contenedor con la tabla
          $("#Educadores_tec").html(tableHTML);

          // Inicializar DataTable
          $("#tablaEducadores").DataTable({
            paging: true,
            searching: true,
            ordering: true,
          });
        } else {
          $("#Educadores_tec").html(
            `<p>${response.message || "No se encontraron educadores."}</p>`
          );
        }
      } catch (error) {
        console.error("Error al procesar los datos:", error);
        $("#Educadores_tec").html("<p>Error al procesar los educadores.</p>");
      }
    },
    error: function (xhr, status, error) {
      console.error("Error en la solicitud:", error);
      $("#Educadores_tec").html(
        "<p>Hubo un problema al obtener los educadores.</p>"
      );
    },
  });
}

obtenerProgramas();
obtenerEstudiantes();
obtenerEducadores();
