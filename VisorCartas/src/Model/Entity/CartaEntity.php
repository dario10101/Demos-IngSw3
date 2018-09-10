<?php
//Esto va en el archivo dentro de src/Model/Entity

namespace App\Model\Entity;

use Cake\ORM\Entity;

class CartaEntity extends Entity
{
    protected $accessible = 
    [
        '*'=> true,
        'id' => false,
        'nombre_corto'=> false
    ];
}

?>