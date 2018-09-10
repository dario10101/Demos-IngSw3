<h1>Cartas</h1>


    <!-- Here is where we iterate through our $articles query object, printing out article info -->
    <?php foreach ($cartas as $carta) : ?>
        <div class="centrado">
            <div class="azul">
                <?= $this->Html->link($carta->nombre, ['action' => 'view', $carta->nombre_corto]) ?> 
            </div>
          
            <?= $this->Html->image($carta->url_imagen, ["class"=>"centrado"]) ?>     
            
        </div>           
    <?php endforeach; ?>
    <?= $this->Html->link("Agregar nueva carta", ["action"=>"add"])?>
    <form class = "centrado" method="get" >
            <select name="cartas" onchange="this.form.submit()">
                <option value"0"> --Seleccione--</option>
                <option value="0">Bola</option>
                <option value="1">Dragón</option>
                <option value="2">Ángel</option>                
            </select>
            
        </form>
    
        <p class="centrado"> 
                Sitio web creado dinámicamente con la carta solicitada, usando PHP
        </p>
</table>