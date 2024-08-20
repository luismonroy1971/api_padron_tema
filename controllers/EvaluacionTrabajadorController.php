namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class EvaluacionController extends Controller
{
    // Crear una nueva evaluación
    public function store(Request $request)
    {
        DB::select('CALL sp_create_evaluacion(?, ?, ?, ?)', [
            $request->id_usuario,
            $request->fecha_evaluacion,
            $request->detalles_calificacion,
            $request->puntuacion_global,
        ]);

        return response()->json(['message' => 'Evaluación creada con éxito'], 201);
    }

    // Leer la información de una evaluación
    public function show($id)
    {
        $evaluacion = DB::select('CALL sp_read_evaluacion(?)', [$id]);

        if (!$evaluacion) {
            return response()->json(['message' => 'Evaluación no encontrada'], 404);
        }

        return response()->json($evaluacion[0]);
    }

    // Actualizar una evaluación
    public function update(Request $request, $id)
    {
        DB::select('CALL sp_update_evaluacion(?, ?, ?, ?, ?)', [
            $id,
            $request->id_usuario,
            $request->fecha_evaluacion,
            $request->detalles_calificacion,
            $request->puntuacion_global,
        ]);

        return response()->json(['message' => 'Evaluación actualizada con éxito']);
    }

    // Eliminar una evaluación
    public function destroy($id)
    {
        DB::select('CALL sp_delete_evaluacion(?)', [$id]);

        return response()->json(['message' => 'Evaluación eliminada con éxito']);
    }
}
