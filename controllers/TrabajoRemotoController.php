namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\TrabajoRemoto;

class TrabajoRemotoController extends Controller
{
    // Crear un nuevo registro de trabajo remoto
    public function store(Request $request)
    {
        DB::select('CALL sp_create_trabajo_remoto(?, ?, ?, ?, ?, ?, ?)', [
            $request->id_trabajador,
            $request->condiciones_trabajo_remoto,
            $request->tipo_computadora,
            $request->tipo_trabajo,
            $request->conexion_internet,
            $request->ambiente_adecuado,
            $request->equipamiento
        ]);

        return response()->json(['message' => 'Trabajo remoto creado con éxito'], 201);
    }

    // Leer un registro de trabajo remoto
    public function show($id)
    {
        $trabajo_remoto = DB::select('CALL sp_read_trabajo_remoto(?)', [$id]);

        if (!$trabajo_remoto) {
            return response()->json(['message' => 'Trabajo remoto no encontrado'], 404);
        }

        return response()->json($trabajo_remoto[0]);
    }

    // Actualizar un registro de trabajo remoto
    public function update(Request $request, $id)
    {
        DB::select('CALL sp_update_trabajo_remoto(?, ?, ?, ?, ?, ?, ?, ?)', [
            $id,
            $request->id_trabajador,
            $request->condiciones_trabajo_remoto,
            $request->tipo_computadora,
            $request->tipo_trabajo,
            $request->conexion_internet,
            $request->ambiente_adecuado,
            $request->equipamiento
        ]);

        return response()->json(['message' => 'Trabajo remoto actualizado con éxito']);
    }

    // Eliminar un registro de trabajo remoto
    public function destroy($id)
    {
        DB::select('CALL sp_delete_trabajo_remoto(?)', [$id]);

        return response()->json(['message' => 'Trabajo remoto eliminado con éxito']);
    }
}
