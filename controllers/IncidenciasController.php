namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\Incidencias;

class IncidenciasController extends Controller
{
    // Crear un nuevo registro de incidencias
    public function store(Request $request)
    {
        DB::select('CALL sp_create_incidencias(?, ?, ?, ?, ?, ?, ?)', [
            $request->id_trabajador,
            $request->codigo,
            $request->dias,
            $request->horas,
            $request->importe,
            $request->mes,
            $request->anio
        ]);

        return response()->json(['message' => 'Incidencia creada con éxito'], 201);
    }

    // Leer un registro de incidencias
    public function show($id)
    {
        $incidencia = DB::select('CALL sp_read_incidencias(?)', [$id]);

        if (!$incidencia) {
            return response()->json(['message' => 'Incidencia no encontrada'], 404);
        }

        return response()->json($incidencia[0]);
    }

    // Actualizar un registro de incidencias
    public function update(Request $request, $id)
    {
        DB::select('CALL sp_update_incidencias(?, ?, ?, ?, ?, ?, ?, ?)', [
            $id,
            $request->id_trabajador,
            $request->codigo,
            $request->dias,
            $request->horas,
            $request->importe,
            $request->mes,
            $request->anio
        ]);

        return response()->json(['message' => 'Incidencia actualizada con éxito']);
    }

    // Eliminar un registro de incidencias
    public function destroy($id)
    {
        DB::select('CALL sp_delete_incidencias(?)', [$id]);

        return response()->json(['message' => 'Incidencia eliminada con éxito']);
    }
}
