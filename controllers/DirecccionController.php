namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\Direccion;

class DireccionController extends Controller
{
    // Crear una nueva dirección
    public function store(Request $request)
    {
        DB::select('CALL sp_create_direccion(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)', [
            $request->id_trabajador,
            $request->tipo_via_direccion1,
            $request->nombre_via_direccion1,
            $request->numero_via_direccion1,
            $request->departamento_no_direccion1,
            $request->interior_direccion1,
            $request->manzana_direccion1,
            $request->lote_direccion1,
            $request->km_direccion1,
            $request->block_direccion1,
            $request->etapa_direccion1,
            $request->tipo_zona_direccion1,
            $request->nombre_zona_direccion1,
            $request->referencia_direccion1,
            $request->departamento_direccion1,
            $request->provincia_direccion1,
            $request->distrito_direccion1,
            $request->tipo_via_direccion2,
            $request->nombre_via_direccion2,
            $request->numero_via_direccion2,
            $request->departamento_no_direccion2,
            $request->interior_direccion2,
            $request->manzana_direccion2,
            $request->lote_direccion2,
            $request->km_direccion2,
            $request->block_direccion2,
            $request->etapa_direccion2,
            $request->tipo_zona_direccion2,
            $request->nombre_zona_direccion2,
            $request->referencia_direccion2,
            $request->departamento_direccion2,
            $request->provincia_direccion2,
            $request->distrito_direccion2,
        ]);

        return response()->json(['message' => 'Dirección creada con éxito'], 201);
    }

    // Leer la información de una dirección
    public function show($id)
    {
        $direccion = DB::select('CALL sp_read_direccion(?)', [$id]);

        if (!$direccion) {
            return response()->json(['message' => 'Dirección no encontrada'], 404);
        }

        return response()->json($direccion[0]);
    }

    // Actualizar una dirección
    public function update(Request $request, $id)
    {
        DB::select('CALL sp_update_direccion(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)', [
            $id,
            $request->id_trabajador,
            $request->tipo_via_direccion1,
            $request->nombre_via_direccion1,
            $request->numero_via_direccion1,
            $request->departamento_no_direccion1,
            $request->interior_direccion1,
            $request->manzana_direccion1,
            $request->lote_direccion1,
            $request->km_direccion1,
            $request->block_direccion1,
            $request->etapa_direccion1,
            $request->tipo_zona_direccion1,
            $request->nombre_zona_direccion1,
            $request->referencia_direccion1,
            $request->departamento_direccion1,
            $request->provincia_direccion1,
            $request->distrito_direccion1,
            $request->tipo_via_direccion2,
            $request->nombre_via_direccion2,
            $request->numero_via_direccion2,
            $request->departamento_no_direccion2,
            $request->interior_direccion2,
            $request->manzana_direccion2,
            $request->lote_direccion2,
            $request->km_direccion2,
            $request->block_direccion2,
            $request->etapa_direccion2,
            $request->tipo_zona_direccion2,
            $request->nombre_zona_direccion2,
            $request->referencia_direccion2,
            $request->departamento_direccion2,
            $request->provincia_direccion2,
            $request->distrito_direccion2,
        ]);

        return response()->json(['message' => 'Dirección actualizada con éxito']);
    }

    // Eliminar una dirección
    public function destroy($id)
    {
        DB::select('CALL sp_delete_direccion(?)', [$id]);

        return response()->json(['message' => 'Dirección eliminada con éxito']);
    }
}
