namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\DerechoHabientes;

class DerechoHabientesController extends Controller
{
    // Crear un nuevo derecho habiente
    public function store(Request $request)
    {
        DB::select('CALL sp_create_derecho_habientes(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)', [
            $request->id_trabajador,
            $request->tipo_documento_identificacion,
            $request->numero_documento_identificacion,
            $request->pais_emision_documento,
            $request->fecha_nacimiento,
            $request->apellido_paterno,
            $request->apellido_materno,
            $request->nombres,
            $request->sexo,
            $request->vinculo_familiar,
            $request->tipo_documento_acredita_vinculo,
            $request->numero_documento_acredita_vinculo,
            $request->mes_concepcion
        ]);

        return response()->json(['message' => 'Derecho habiente creado con éxito'], 201);
    }

    // Leer un derecho habiente
    public function show($id)
    {
        $derecho_habiente = DB::select('CALL sp_read_derecho_habientes(?)', [$id]);

        if (!$derecho_habiente) {
            return response()->json(['message' => 'Derecho habiente no encontrado'], 404);
        }

        return response()->json($derecho_habiente[0]);
    }

    // Actualizar un derecho habiente
    public function update(Request $request, $id)
    {
        DB::select('CALL sp_update_derecho_habientes(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)', [
            $id,
            $request->id_trabajador,
            $request->tipo_documento_identificacion,
            $request->numero_documento_identificacion,
            $request->pais_emision_documento,
            $request->fecha_nacimiento,
            $request->apellido_paterno,
            $request->apellido_materno,
            $request->nombres,
            $request->sexo,
            $request->vinculo_familiar,
            $request->tipo_documento_acredita_vinculo,
            $request->numero_documento_acredita_vinculo,
            $request->mes_concepcion
        ]);

        return response()->json(['message' => 'Derecho habiente actualizado con éxito']);
    }

    // Eliminar un derecho habiente
    public function destroy($id)
    {
        DB::select('CALL sp_delete_derecho_habientes(?)', [$id]);

        return response()->json(['message' => 'Derecho habiente eliminado con éxito']);
    }
}
