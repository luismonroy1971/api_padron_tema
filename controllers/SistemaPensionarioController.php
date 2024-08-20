namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\SistemaPensionario;

class SistemaPensionarioController extends Controller
{
    // Crear un nuevo registro del sistema pensionario
    public function store(Request $request)
    {
        DB::select('CALL sp_create_sistema_pensionario(?, ?, ?, ?)', [
            $request->id_trabajador,
            $request->sistema_pensionario,
            $request->tipo_comision_afp,
            $request->cuspp
        ]);

        return response()->json(['message' => 'Sistema pensionario creado con éxito'], 201);
    }

    // Leer un registro del sistema pensionario
    public function show($id)
    {
        $sistema_pensionario = DB::select('CALL sp_read_sistema_pensionario(?)', [$id]);

        if (!$sistema_pensionario) {
            return response()->json(['message' => 'Sistema pensionario no encontrado'], 404);
        }

        return response()->json($sistema_pensionario[0]);
    }

    // Actualizar un registro del sistema pensionario
    public function update(Request $request, $id)
    {
        DB::select('CALL sp_update_sistema_pensionario(?, ?, ?, ?, ?)', [
            $id,
            $request->id_trabajador,
            $request->sistema_pensionario,
            $request->tipo_comision_afp,
            $request->cuspp
        ]);

        return response()->json(['message' => 'Sistema pensionario actualizado con éxito']);
    }

    // Eliminar un registro del sistema pensionario
    public function destroy($id)
    {
        DB::select('CALL sp_delete_sistema_pensionario(?)', [$id]);

        return response()->json(['message' => 'Sistema pensionario eliminado con éxito']);
    }
}
