

<div class="centrado">
    <div class="azul">
        <?= $this->Html->link($carta->nombre, ['action' => 'view', $carta->nomre_corto]) ?> 
    </div>
          
        <?= $this->Html->image($carta->url_imagen, ["class"=>"centrado"]) ?>     
        <p class="centrado"> 
            <?php echo $carta->texto?>
        </p>           
</div>      
    
