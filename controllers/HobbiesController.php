namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\Hobbies;

class HobbiesController extends Controller
{
    // Crear un nuevo hobbie
    public function store(Request $request)
    {
        DB::select('CALL sp_create_hobbies(?, ?)', [
            $request->id_trabajador,
            $request->hobbie
        ]);

        return response()->json(['message' => 'Hobbie creado con éxito'], 201);
    }

    // Leer un hobbie
    public function show($id)
    {
        $hobbie = DB::select('CALL sp_read_hobbies(?)', [$id]);

        if (!$hobbie) {
            return response()->json(['message' => 'Hobbie no encontrado'], 404);
        }

        return response()->json($hobbie[0]);
    }

    // Actualizar un hobbie
    public function update(Request $request, $id)
    {
        DB::select('CALL sp_update_hobbies(?, ?, ?)', [
            $id,
            $request->id_trabajador,
            $request->hobbie
        ]);

        return response()->json(['message' => 'Hobbie actualizado con éxito']);
    }

    // Eliminar un hobbie
    public function destroy($id)
    {
        DB::select('CALL sp_delete_hobbies(?)', [$id]);

        return response()->json(['message' => 'Hobbie eliminado con éxito']);
    }
}
