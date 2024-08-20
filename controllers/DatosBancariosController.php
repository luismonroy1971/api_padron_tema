namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\DatosBancarios;

class DatosBancariosController extends Controller
{
    // Crear un nuevo registro de datos bancarios
    public function store(Request $request)
    {
        DB::select('CALL sp_create_datos_bancarios(?, ?, ?, ?)', [
            $request->id_trabajador,
            $request->banco,
            $request->numero_cuenta_abono,
            $request->codigo_interbancario
        ]);

        return response()->json(['message' => 'Datos bancarios creados con éxito'], 201);
    }

    // Leer un registro de datos bancarios
    public function show($id)
    {
        $datos_bancarios = DB::select('CALL sp_read_datos_bancarios(?)', [$id]);

        if (!$datos_bancarios) {
            return response()->json(['message' => 'Datos bancarios no encontrados'], 404);
        }

        return response()->json($datos_bancarios[0]);
    }

    // Actualizar un registro de datos bancarios
    public function update(Request $request, $id)
    {
        DB::select('CALL sp_update_datos_bancarios(?, ?, ?, ?, ?)', [
            $id,
            $request->id_trabajador,
            $request->banco,
            $request->numero_cuenta_abono,
            $request->codigo_interbancario
        ]);

        return response()->json(['message' => 'Datos bancarios actualizados con éxito']);
    }

    // Eliminar un registro de datos bancarios
    public function destroy($id)
    {
        DB::select('CALL sp_delete_datos_bancarios(?)', [$id]);

        return response()->json(['message' => 'Datos bancarios eliminados con éxito']);
    }
}
