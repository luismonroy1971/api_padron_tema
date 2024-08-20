namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\DatosLaboralesPrevios;

class DatosLaboralesPreviosController extends Controller
{
    // Crear un nuevo registro de datos laborales previos
    public function store(Request $request)
    {
        DB::select('CALL sp_create_datos_laborales_previos(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)', [
            $request->id_trabajador,
            $request->fecha_inicio_ultima_experiencia,
            $request->fecha_fin_ultima_experiencia,
            $request->organizacion_ultima_experiencia,
            $request->motivo_baja_ultima_experiencia,
            $request->remuneracion_ultima_experiencia,
            $request->fecha_inicio_penultima_experiencia,
            $request->fecha_fin_penultima_experiencia,
            $request->organizacion_penultima_experiencia,
            $request->motivo_baja_penultima_experiencia,
            $request->remuneracion_penultima_experiencia
        ]);

        return response()->json(['message' => 'Datos laborales previos creados con éxito'], 201);
    }

    // Leer un registro de datos laborales previos
    public function show($id)
    {
        $datos_laborales_previos = DB::select('CALL sp_read_datos_laborales_previos(?)', [$id]);

        if (!$datos_laborales_previos) {
            return response()->json(['message' => 'Datos laborales previos no encontrados'], 404);
        }

        return response()->json($datos_laborales_previos[0]);
    }

    // Actualizar un registro de datos laborales previos
    public function update(Request $request, $id)
    {
        DB::select('CALL sp_update_datos_laborales_previos(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)', [
            $id,
            $request->id_trabajador,
            $request->fecha_inicio_ultima_experiencia,
            $request->fecha_fin_ultima_experiencia,
            $request->organizacion_ultima_experiencia,
            $request->motivo_baja_ultima_experiencia,
            $request->remuneracion_ultima_experiencia,
            $request->fecha_inicio_penultima_experiencia,
            $request->fecha_fin_penultima_experiencia,
            $request->organizacion_penultima_experiencia,
            $request->motivo_baja_penultima_experiencia,
            $request->remuneracion_penultima_experiencia
        ]);

        return response()->json(['message' => 'Datos laborales previos actualizados con éxito']);
    }

    // Eliminar un registro de datos laborales previos
    public function destroy($id)
    {
        DB::select('CALL sp_delete_datos_laborales_previos(?)', [$id]);

        return response()->json(['message' => 'Datos laborales previos eliminados con éxito']);
    }
}
