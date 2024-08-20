namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\Trabajador;

class TrabajadorController extends Controller
{
    // Crear un nuevo trabajador
    public function store(Request $request)
    {
        DB::select('CALL sp_create_trabajador(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)', [
            $request->tipo_documento,
            $request->numero_documento,
            $request->pais_emision_documento,
            $request->fecha_nacimiento,
            $request->apellido_paterno,
            $request->apellido_materno,
            $request->primer_nombre,
            $request->segundo_nombre,
            $request->tercer_nombre,
            $request->sexo,
            $request->grupo_sanguineo,
            $request->estado_civil,
            $request->nacionalidad,
            $request->numero_celular,
            $request->numero_celular_emergencia,
            $request->correo_electronico,
            $request->hijos_menores_edad,
            $request->numero_hijos_menores,
            $request->estado_trabajador,
        ]);

        return response()->json(['message' => 'Trabajador creado con éxito'], 201);
    }

    // Leer la información de un trabajador
    public function show($id)
    {
        $trabajador = DB::select('CALL sp_read_trabajador(?)', [$id]);

        if (!$trabajador) {
            return response()->json(['message' => 'Trabajador no encontrado'], 404);
        }

        return response()->json($trabajador[0]);
    }

    // Actualizar un trabajador
    public function update(Request $request, $id)
    {
        DB::select('CALL sp_update_trabajador(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)', [
            $id,
            $request->tipo_documento,
            $request->numero_documento,
            $request->pais_emision_documento,
            $request->fecha_nacimiento,
            $request->apellido_paterno,
            $request->apellido_materno,
            $request->primer_nombre,
            $request->segundo_nombre,
            $request->tercer_nombre,
            $request->sexo,
            $request->grupo_sanguineo,
            $request->estado_civil,
            $request->nacionalidad,
            $request->numero_celular,
            $request->numero_celular_emergencia,
            $request->correo_electronico,
            $request->hijos_menores_edad,
            $request->numero_hijos_menores,
            $request->estado_trabajador,
        ]);

        return response()->json(['message' => 'Trabajador actualizado con éxito']);
    }

    // Eliminar un trabajador
    public function destroy($id)
    {
        DB::select('CALL sp_delete_trabajador(?)', [$id]);

        return response()->json(['message' => 'Trabajador eliminado con éxito']);
    }
}
