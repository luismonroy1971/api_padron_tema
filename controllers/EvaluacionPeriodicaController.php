namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class EvaluacionPeriodicaController extends Controller
{
    // Crear una nueva evaluación periódica
    public function store(Request $request)
    {
        DB::select('CALL sp_create_evaluacion_periodica(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)', [
            $request->id_trabajador,
            $request->periodo,
            $request->fecha,
            $request->conocimiento_puesto,
            $request->calidad_en_desarrollos,
            $request->manejo_programas_informaticos,
            $request->capacidad_aprendizaje,
            $request->cumplimiento_procesos_sig,
            $request->trabajo_en_equipo,
            $request->comunicacion_asertiva,
            $request->flexibilidad_adaptacion_cambio,
            $request->capacidad_resolucion_creatividad_proactividad,
            $request->organizacion_gestion_tiempo,
            $request->orientacion_cliente,
            $request->compromiso,
            $request->manejo_situaciones_criticas,
            $request->liderazgo,
            $request->gestion_personas,
            $request->empowerment,
            $request->orientacion_resultado,
            $request->coordinador,
        ]);

        return response()->json(['message' => 'Evaluación periódica creada con éxito'], 201);
    }

    // Leer la información de una evaluación periódica
    public function show($id)
    {
        $evaluacion = DB::select('CALL sp_read_evaluacion_periodica(?)', [$id]);

        if (!$evaluacion) {
            return response()->json(['message' => 'Evaluación periódica no encontrada'], 404);
        }

        return response()->json($evaluacion[0]);
    }

    // Actualizar una evaluación periódica
    public function update(Request $request, $id)
    {
        DB::select('CALL sp_update_evaluacion_periodica(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)', [
            $id,
            $request->id_trabajador,
            $request->periodo,
            $request->fecha,
            $request->conocimiento_puesto,
            $request->calidad_en_desarrollos,
            $request->manejo_programas_informaticos,
            $request->capacidad_aprendizaje,
            $request->cumplimiento_procesos_sig,
            $request->trabajo_en_equipo,
            $request->comunicacion_asertiva,
            $request->flexibilidad_adaptacion_cambio,
            $request->capacidad_resolucion_creatividad_proactividad,
            $request->organizacion_gestion_tiempo,
            $request->orientacion_cliente,
            $request->compromiso,
            $request->manejo_situaciones_criticas,
            $request->liderazgo,
            $request->gestion_personas,
            $request->empowerment,
            $request->orientacion_resultado,
            $request->coordinador,
        ]);

        return response()->json(['message' => 'Evaluación periódica actualizada con éxito']);
    }

    // Eliminar una evaluación periódica
    public function destroy($id)
    {
        DB::select('CALL sp_delete_evaluacion_periodica(?)', [$id]);

        return response()->json(['message' => 'Evaluación periódica eliminada con éxito']);
    }
}
