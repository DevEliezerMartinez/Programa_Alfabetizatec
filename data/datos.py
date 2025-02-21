import pandas as pd

def map_institutions_to_states():
    # Dictionary mapping institutions to their states
    state_mapping = {
        'Campeche': ['I.T. de Campeche', 'I.T. de Chiná', 'ITS de Hopelchen', 'I.T.S. de Champotón', 'I.T.S. de Escárcega', 'I.T.S. de Calkiní'],
        'Ciudad de México': ['I.T. de Álvaro Obregón', 'I.T. de Tláhuac', 'I.T. de Tláhuac II', 'I.T. de Tláhuac III', 'I.T. de Gustavo A. Madero', 'I.T. de Gustavo A. Madero II', 'I.T. de Iztapalapa', 'I.T. de Iztapalapa II', 'I.T. de Iztapalapa III', 'I.T. de Milpa Alta', 'I.T. de Milpa Alta II'],
        'Chihuahua': ['I.T. de Chihuahua', 'I.T. de Chihuahua II', 'I.T. de Cd. Juárez', 'I.T. de Delicias', 'I.T. de Parral', 'CRODE Chihuahua', 'I.T. de Cd. Cuauhtémoc', 'I.T.S. de Nuevo Casas Grandes'],
        'Guanajuato': ['I.T. de Celaya', 'I.T.S. de Irapuato', 'I.T. de Roque', 'I.T.S. de Guanajuato', 'I.T.S. de Sur de Guanajuato', 'ITS de Purísima del Rincón', 'ITS de Abasolo'],
        'San Luis Potosí': ['I.T.S. de Río Verde', 'I.T. de San Luis Potosí', 'I.T. de Cd. Valles', 'I.T. de Matehuala', 'I.T.S. de Tamazunchale'],
        'Michoacán': ['I.T. de Lázaro Cárdenas', 'I.T. de Morelia', 'I.T. de Valle de Morelia', 'I.T. de La Piedad', 'I.T. de Zitácuaro', 'I.T.S. de Puruándiro', 'I.T.S. de Tacámbaro', 'I.T.S. de Los Reyes', 'I.T.S. de Cd. Hidalgo', 'I.T.S. de Huetamo', 'I.T.S. de Coalcomán', 'I.T.S. de Pátzcuaro', 'I.T.S. de Purhepecha'],
        'Yucatán': ['I.T. de Mérida', 'I.T. de Tizimín', 'I.T.S. de Progreso', 'I.T.S. de Valladolid', 'I.T.S. de Motul'],
        'Veracruz': ['I.T.S. de Álamo Temapache', 'I.T. de Cerro Azul', 'I.T.S. de Xalapa', 'I.T.S. de Huatusco', 'I.T. de Úrsulo Galván', 'I.T. de Orizaba', 'CRODE Orizaba', 'I.T.S. de Coatzacoalcos', 'I.T. de Boca del Río', 'I.T.S. de Poza Rica', 'I.T.S. de Tantoyuca', 'I.T.S. de Zongolica', 'I.T.S. de Chicontepec', 'I.T.S. de Misantla', 'I.T.S. de Cosamaloapan', 'I.T.S. de Alvarado', 'I.T.S. de Jesús Carranza', 'I.T.S. de Juan Rodríguez Clara', 'I.T.S. de Acayucan', 'I.T.S. de Naranjos', 'I.T.S. de San Andrés Tuxtla', 'I.T.S. de Martínez de la Torre', 'I.T.S. de Tierra Blanca', 'I.T.S. de Perote', 'I.T.S. de Las Choapas'],
        'Sinaloa': ['I.T. de Culiacán', 'I.T. de Mazatlán', 'I.T.S. de El Dorado', 'I.T.S. de Guasave', 'I.T. de Sinaloa de Leyva'],
        'Guerrero': ['I.T.S. de La Costa Chica', 'I.T. de Iguala', 'I.T. de Acapulco', 'I.T. de San Marcos', 'I.T. de Cd. Altamirano', 'I.T. de Chilpancingo', 'I.T. de Costa Grande'],
        'Nuevo León': ['I.T. de Nuevo León', 'I.T. de Linares'],
        'Coahuila': ['T.E.S. de La Región Carbonifera', 'I.T.S. de San Pedro de las Colonias', 'I.T.S. de Monclova', 'I.T.S. de Múzquiz', 'I.T.S. de Cd. Acuña', 'I.T. de Piedras Negras', 'I.T. de Saltillo', 'I.T. de La Laguna', 'I.T. de Torreón'],
        'Puebla': ['I.T.S. de Zacapoaxtla', 'I.T.S. de Tepexi de Rodríguez', 'I.T.S. de Acatlán de Osorio', 'I.T. de Puebla', 'I.T.S. de Atlixco', 'I.T. de Tehuacán', 'I.T. de Tecomatlán', 'I.T.S. de Tlatlauquitepec', 'I.T.S. de La Sierra Negra de Ajalpan', 'I.T.S. de Tepeaca', 'I.T.S. de Cd. Serdán', 'I.T.S. de La Sierra Norte de Puebla'],
        'Estado de México': ['I.T. de Toluca', 'T.E.S. de Ote. del Edo. de México', 'T.E.S. de Ixtapaluca', 'T.E.S. de Coacalco', 'T.E.S. de Tianguistenco', 'T.E.S. de Chicoloapan', 'T.E.S. de Huixquilucan', 'T.E.S. de Chalco', 'T.E.S. de Jocotitlán', 'T.E.S. de Cuautitlán Izcalli', 'I.T. de Tlalnepantla', 'T.E.S. de Ecatepec', 'T.E.S. de San Felipe del Progreso', 'T.E.S. de Villa Guerrero', 'I.T.E.S. de Valle de Bravo'],
        'Chiapas': ['I.T. de Tapachula', 'I.T. de Comitancillo', 'I.T. de Frontera Comalapa', 'I.T. de Tuxtla Gutiérrez', 'I.T. de Comitán'],
        'Tabasco': ['I.T.S. de Centla', 'I.T. de La Chontalpa', 'I.T. de Huimanguillo', 'I.T. de Villahermosa', 'I.T.S. de Comalcalco', 'I.T.S. de Villa La Venta'],
        'Oaxaca': ['I.T. del Istmo', 'I.T.S. de Teposcolula', 'I.T. de Pochutla', 'I.T. de Pinotepa', 'I.T. de Tuxtepec', 'I.T. de Tlaxiaco', 'I.T. de Oaxaca', 'I.T. de Valle de Oaxaca', 'I.T. de Valle de Etla', 'I.T.S. de San Miguel El Grande'],
        'Zacatecas': ['I.T.S. de Zacatecas Sur', 'I.T. de Zacatecas', 'I.T.S. de Fresnillo', 'I.T.S. de Nochistlán', 'I.T.S. de Zacatecas Norte', 'I.T.S. de Zacatecas Occidente'],
        'Quintana Roo': ['I.T. de Cancún', 'I.T. de Chetumal', 'I.T.S. de Felipe Carrillo Puerto'],
        'Sonora': ['I.T. de Nogales', 'I.T. de Hermosillo', 'I.T. de Agua Prieta', 'I.T. de Guaymas', 'I.T. de Huatabampo', 'I.T. de Valle del Yaqui', 'I.T.S. de Cajeme', 'I.T.S. de Puerto Peñasco', 'I.T.S. de Cananea'],
        'Querétaro': ['I.T. de San Juan del Río', 'I.T. de Querétaro', 'Centro Interdisciplinario de Investigación y Docencia en Educación Técnica (CIIDET)'],
        'Guanajuato': ['I.T.S. de Salvatierra'],
        'Durango': ['I.T. de Durango', 'I.T. de El Salto', 'I.T. de Valle del Guadiana', 'I.T.S. de Lerdo', 'I.T.S. de Santiago Papasquiaro'],
        'Baja California': ['I.T. de Ensenada', 'I.T. de Tijuana', 'I.T. de Mexicali'],
        'Morelos': ['I.T. de Zacatepec', 'I.T. de Cuautla'],
        'Jalisco': ['I.T. de Tlajomulco', 'I.T. de Cd. Guzmán', 'I.T. de Ocotlán'],
        'Hidalgo': ['I.T.S. de Ote. del Edo. de Hidalgo', 'I.T. de Atitalaquia', 'I.T.S. de Huichapan', 'I.T. de Huejutla'],
        'Tamaulipas': ['I.T. de Cd. Victoria', 'I.T.S. de Mante', 'I.T. de Cd. Madero', 'I.T. de Nuevo Laredo', 'I.T. de Reynosa', 'I.T. de Altamira'],
        'Nayarit': ['I.T. de Norte de Nayarit', 'I.T. de Tepic', 'I.T. de Sur de Nayarit', 'I.T. de Bahía de Banderas'],
        'Baja California Sur': ['I.T.S. de Mulegé', 'I.T.S. de Cd. Constitución', 'I.T.E.S. de Los Cabos'],
        'Aguascalientes': ['I.T. de Aguascalientes', 'I.T. de Pabellón de Arteaga', 'I.T. de El Llano Aguascalientes'],
        'Colima': ['I.T. de Colima'],
        'Tlaxcala': ['I.T. de Apizaco', 'I.T.S. de Tlaxco'],
        'Michoacán': ['T.E.S. de Zamora']
    }
    
    # Create empty DataFrame
    df = pd.DataFrame(columns=['nombre', 'estado'])
    
    # Fill DataFrame with institutions and their states
    rows = []
    for state, institutions in state_mapping.items():
        for institution in institutions:
            rows.append({'nombre': institution, 'estado': state})
    
    df = pd.DataFrame(rows)
    return df

# Create and save the CSV
result_df = map_institutions_to_states()
result_df.to_csv('tecnologicos_con_estados.csv', index=False)
print("CSV file has been created with institutions and their corresponding states.")