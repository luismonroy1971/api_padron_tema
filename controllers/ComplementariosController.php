namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\Complementarios;

class ComplementariosController extends Controller
{
    // Crear un nuevo registro complementario
    public function store(Request $request)
    {
        DB::select('CALL sp_create_complementarios(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)', [
            $request->id_trabajador,
            $request->regimen_laboral,
            $request->ocupacion,
            $request->discapacidad,
            $request->sctr_pension,
            $request->tipo_contrato,
            $request->sujeto_regimen_atipico,
            $request->jornada_maxima,
            $request->horario_nocturno,
            $request->sindicato,
            $request->periodo_remuneracion,
            $request->sueldo,
            $request->situacion,
            $request->exonerado_renta_5ta,
            $request->situacion_especial,
            $request->tipo_pago,
            $request->categoria_ocupacional,
            $request->convenio_doble_tributacion,
            $request->sub_centro_costo,
            $request->centro_costo,
            $request->sub_sub_centro_costo,
            $request->area,
            $request->cargo_boleta
        ]);

        return response()->json(['message' => 'Registro complementario creado con éxito'], 201);
    }

    // Leer un registro complementario
    public function show($id)
    {
        $complementarios = DB::select('CALL sp_read_complementarios(?)', [$id]);

        if (!$complementarios) {
            return response()->json(['message' => 'Registro complementario no encontrado'], 404);
        }

        return response()->json($complementarios[0]);
    }

    // Actualizar un registro complementario
    public function update(Request $request, $id)
    {
        DB::select('CALL sp_update_complementarios(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)', [
            $id,
            $request->id_trabajador,
            $request->regimen_laboral,
            $request->ocupacion,
            $request->discapacidad,
            $request->sctr_pension,
            $request->tipo_contrato,
            $request->sujeto_regimen_atipico,
            $request->jornada_maxima,
            $request->horario_nocturno,
            $request->sindicato,
            $request->periodo_remuneracion,
            $request->sueldo,
            $request->situacion,
            $request->exonerado_renta_5ta,
            $request->situacion_especial,
            $request->tipo_pago,
            $request->categoria_ocupacional,
            $request->convenio_doble_tributacion,
            $request->sub_centro_costo,
            $request->centro_costo,
            $request->sub_sub_centro_costo,
            $request->area,
            $request->cargo_boleta
        ]);

        return response()->json(['message' => 'Registro complementario actualizado con éxito']);
    }

    // Eliminar un registro complementario
    public function destroy($id)
    {
        DB::select('CALL sp_delete_complementarios(?)', [$id]);

        return response()->json(['message' => 'Registro complementario eliminado con éxito']);
    }
}
