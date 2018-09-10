<?php
//archivo en src/Controller/
namespace App\Controller;


class CartasController extends AppController
{
    public function index()
    {
        $this->loadComponent('Paginator');
        $cartas = $this->Paginator->paginate($this->Cartas->find());
        $this->set(compact('cartas'));
    }

    public function view($nombre_corto)
    {
        $carta = $this->Cartas->findByNombreCorto($nombre_corto)->firstOrFail();
        $this->set(compact('carta'));
    }

    public function add()
    {
        $carta = $this->Cartas->newEntity();
        if($this->request->is("post"))
        {
            $carta = $this->Cartas->patchEntity($carta, $this->request->getData());
            $carta->usuario_id = 1;
            if($this->Cartas->save($carta))
            {
                $this->Flash->success("La carta ha sido guardad satisfactoriamente");
                return $this->redirect(["action"=>"index"]);
            }
            else
            {
                $this->Flash->error("No se pudo guardar la carta");
            }
        }
        $this->set(compact('carta', $carta));

    }

}


?>