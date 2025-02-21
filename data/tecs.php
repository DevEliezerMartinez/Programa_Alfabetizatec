<?php
// Incluir el autoload de Composer
require '../vendor/autoload.php';

use PhpOffice\PhpSpreadsheet\IOFactory;
use PhpOffice\PhpSpreadsheet\Worksheet\Worksheet;

$file = './tec.xlsx';

// Cargar el archivo Excel
$spreadsheet = IOFactory::load($file);

// Obtener la primera hoja
$sheet = $spreadsheet->getActiveSheet();

// Obtener todas las filas de la hoja
$data = $sheet->toArray();

// Array para almacenar las filas sin duplicados
$uniqueData = [];
$uniqueInstitutes = [];

// Recorrer las filas del Excel
foreach ($data as $row) {
    // Extraer el nombre del instituto (primera columna)
    $instituteName = $row[0];
    
    // Si el instituto no ha sido procesado antes, agregarlo al array único
    if (!in_array($instituteName, $uniqueInstitutes)) {
        // Agregar el nombre del instituto a la lista de procesados
        $uniqueInstitutes[] = $instituteName;
        
        // Guardar la fila completa en el array único
        $uniqueData[] = $row;
    }
}

// Ahora $uniqueData contiene los datos sin duplicados
// Imprimir los resultados
echo "<table border='1'>
        <tr>
            <th>Nombre del Instituto</th>
            <th>Tipo de Plantel</th>
            <th>Programa</th>
            <th>Modalidad</th>
        </tr>";

foreach ($uniqueData as $row) {
    echo "<tr>
            <td>" . htmlspecialchars($row[0]) . "</td>
            <td>" . htmlspecialchars($row[1]) . "</td>
            <td>" . htmlspecialchars($row[2]) . "</td>
            <td>" . htmlspecialchars($row[3]) . "</td>
          </tr>";
}

// Mostrar el total de institutos únicos
$totalInstitutes = count($uniqueData);
echo "<tr>
        <td colspan='4'>Total de Institutos Únicos: " . $totalInstitutes . "</td>
      </tr>";

echo "</table>";
?>
