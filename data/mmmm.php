<?php
// Cargar el autoload de Composer
require '../vendor/autoload.php';

// Usar las clases necesarias de PhpSpreadsheet
use PhpOffice\PhpSpreadsheet\IOFactory;

// Cargar el archivo Excel de coordinadores
$inputFileName = './coordinadores_programa.xlsx';
$spreadsheet = IOFactory::load($inputFileName);
$sheet = $spreadsheet->getActiveSheet();
$data = $sheet->toArray(null, true, true, true);

// Cargar el archivo Excel de tecnológicos
$file = './tec.xlsx';
$tecSpreadsheet = IOFactory::load($file);
$tecSheet = $tecSpreadsheet->getActiveSheet();
$tecData = $tecSheet->toArray(null, true, true, true);

// Extraer los nombres de los tecnológicos de ambos archivos
$tecnologicos = [];
foreach ($tecData as $index => $row) {
    // Suponiendo que los nombres de los tecnológicos están en la columna B (índice 2) del archivo tec.xlsx
    if ($index > 1 && !empty($row['B'])) {
        $tecnologicos[] = trim($row['B']);
    }
}

// Crear un array para los nombres del archivo coordinadores
$coordinadores = [];
foreach ($data as $index => $row) {
    if ($index > 1 && !empty($row['O'])) {
        $coordinadores[] = trim($row['O']);
    }
}

// Función para buscar coincidencias parciales con los nombres en tec.xlsx
function buscarCoincidenciaParcial($nombre, $tecnologicos) {
    foreach ($tecnologicos as $tec) {
        // Usamos stripos para encontrar coincidencias insensibles a mayúsculas/minúsculas
        if (stripos($tec, $nombre) !== false || stripos($nombre, $tec) !== false) {
            return true; // Encontró una coincidencia parcial
        }
    }
    return false; // No encontró coincidencia
}

// Crear un array para los nombres final de los tecnológicos con coincidencias parciales
$finalTecnologicos = [];
foreach ($coordinadores as $tecnologico) {
    if (buscarCoincidenciaParcial($tecnologico, $tecnologicos)) {
        $finalTecnologicos[] = $tecnologico;
    } else {
        $finalTecnologicos[] = ' '; // Insertar vacío si no se encuentra
    }
}

// Contar las repeticiones de cada nombre de tecnológico
$conteoTecnologicos = array_count_values($finalTecnologicos);

// Mostrar el resultado en una tabla
echo "<h3>Resumen de Tecnológicos</h3>";
echo "<table border='1' cellpadding='5' cellspacing='0'>";
echo "<thead>
        <tr>
            <th>Nombre del Tecnológico</th>
            <th>Repeticiones</th>
        </tr>
      </thead>";
echo "<tbody>";

// Iterar sobre el array de nombres de tecnológicos y sus repeticiones
foreach ($conteoTecnologicos as $nombre => $repeticiones) {
    echo "<tr>
            <td>$nombre</td>
            <td>$repeticiones</td>
          </tr>";
}

echo "</tbody>";
echo "</table>";
?>
