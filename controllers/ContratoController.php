namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\Contrato;

class ContratoController extends Controller
{
    // Crear un nuevo registro de contrato
    public function store(Request $request)
    {
        DB::select('CALL sp_create_contrato(?, ?, ?, ?, ?, ?, ?, ?)', [
            $request->id_trabajador,
            $request->fecha_inicio,
            $request->fecha_fin,
            $request->motivo_fin_baja,
            $request->tipo_trabajador,
            $request->regimen_salud,
            $request->eps_servicios_propios,
            $request->sctr_salud
        ]);

        return response()->json(['message' => 'Contrato creado con éxito'], 201);
    }

    // Leer un registro de contrato
    public function show($id)
    {
        $contrato = DB::select('CALL sp_read_contrato(?)', [$id]);

        if (!$contrato) {
            return response()->json(['message' => 'Contrato no encontrado'], 404);
        }

        return response()->json($contrato[0]);
    }

    // Actualizar un registro de contrato
    public function update(Request $request, $id)
    {
        DB::select('CALL sp_update_contrato(?, ?, ?, ?, ?, ?, ?, ?, ?)', [
            $id,
            $request->id_trabajador,
            $request->fecha_inicio,
            $request->fecha_fin,
            $request->motivo_fin_baja,
            $request->tipo_trabajador,
            $request->regimen_salud,
            $request->eps_servicios_propios,
            $request->sctr_salud
        ]);

        return response()->json(['message' => 'Contrato actualizado con éxito']);
    }

    // Eliminar un registro de contrato
    public function destroy($id)
    {
        DB::select('CALL sp_delete_contrato(?)', [$id]);

        return response()->json(['message' => 'Contrato eliminado con éxito']);
    }
}
