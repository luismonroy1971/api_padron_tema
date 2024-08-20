namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\DatosEducativos;

class DatosEducativosController extends Controller
{
    // Crear un nuevo registro de datos educativos
    public function store(Request $request)
    {
        DB::select('CALL sp_create_datos_educativos(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)', [
            $request->id_trabajador,
            $request->anio_egreso_educacion_superior,
            $request->nivel_alcanzado_educativo,
            $request->centro_estudios_educacion_superior,
            $request->nombre_profesion,
            $request->nombre_post_grado_1,
            $request->institucion_educativa_post_grado_1,
            $request->fecha_inicio_estudio_post_grado_1,
            $request->fecha_final_estudio_post_grado_1,
            $request->nombre_post_grado_2,
            $request->institucion_educativa_post_grado_2,
            $request->fecha_inicio_estudio_post_grado_2,
            $request->fecha_final_estudio_post_grado_2
        ]);

        return response()->json(['message' => 'Datos educativos creados con éxito'], 201);
    }

    // Leer un registro de datos educativos
    public function show($id)
    {
        $datos_educativos = DB::select('CALL sp_read_datos_educativos(?)', [$id]);

        if (!$datos_educativos) {
            return response()->json(['message' => 'Datos educativos no encontrados'], 404);
        }

        return response()->json($datos_educativos[0]);
    }

    // Actualizar un registro de datos educativos
    public function update(Request $request, $id)
    {
        DB::select('CALL sp_update_datos_educativos(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)', [
            $id,
            $request->id_trabajador,
            $request->anio_egreso_educacion_superior,
            $request->nivel_alcanzado_educativo,
            $request->centro_estudios_educacion_superior,
            $request->nombre_profesion,
            $request->nombre_post_grado_1,
            $request->institucion_educativa_post_grado_1,
            $request->fecha_inicio_estudio_post_grado_1,
            $request->fecha_final_estudio_post_grado_1,
            $request->nombre_post_grado_2,
            $request->institucion_educativa_post_grado_2,
            $request->fecha_inicio_estudio_post_grado_2,
            $request->fecha_final_estudio_post_grado_2
        ]);

        return response()->json(['message' => 'Datos educativos actualizados con éxito']);
    }

    // Eliminar un registro de datos educativos
    public function destroy($id)
    {
        DB::select('CALL sp_delete_datos_educativos(?)', [$id]);

        return response()->json(['message' => 'Datos educativos eliminados con éxito']);
    }
}
