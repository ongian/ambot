<style>
    #order-field{
        height:54em;
        overflow:auto;
    }
    .order-list{
        height:18em;
        overflow:auto;
        position:relative;
    }
    .order-list-header{
        position:sticky;
        top:0;
        z-index:2 !important;
    }
    .order-body{
        position:relative;
        z-index:1 !important;
    }
    #order-field:empty{
        display:flex;
        align-items:center;
        justify-content:center;
    }
    #order-field:empty:after{
        content:"No order has been queued yet.";
        color: #b7b4b4;
        font-size: 1.7em;
        font-style: italic;
    }
</style>
<div class="content bg-gradient-warning py-3 px-4">
    <h3 class="font-weight-bolder text-light">Order List (Kitchen Side)</h3>
</div>
<div class="row mt-n4 justify-content-center">
    <div class="col-lg-11 col-md-11 col-sm-12 col-xs-12">
        <div class="card rounded-0">
            <div class="card-body">
                <div id="order-field" class="row row-cols-lg-3 rol-cols-md-2 row-cols-sm-1 gx-2 py-1"></div>
            </div>
        </div>
    </div>
</div>
<noscript id="order-clone">
<div class="col order-item">
    <div class="card rounded-0 shadow card-outline card-warning">
        <div class="card-header py-1">
            <div class="card-title"><b>Queue Code: 10001</b></div>
        </div>
        <div class="card-body">
            <div class="order-list">
                <div class="d-flex w-100 order-list-header bg-gradient-warning">
                    <div class="col-9 m-0 border"><b>Product</b></div>
                    <div class="col-3 m-0 border text-center">QTY</div>
                </div>
                <div class="order-body">
                </div>
            </div>
        </div>
        <div class="card-footer py-1 text-center">
                <button class="btn btn-sm btn-light bg-gradient-light border order-served px-2 btn-block rounded-pill" type="button" data-id="">Serve</button>
        </div>
    </div>
</div>
</noscript>
<script>
    function get_order(){
        listed = []
        $('.order-item').each(function(){
            listed.push($(this).attr('data-id'))
        })
        $.ajax({
            url:_base_url_+"classes/Master.php?f=get_order",
            method:'POST',
            data:{listed : listed},
            dataType:'json',
            error:err=>{
                console.log(err)
                alert_toast("An error occurred", "error")
            },
            success:function(resp){
                if(resp.status == 'success'){
                    Object.keys(resp.data).map(k=>{
                        var data = resp.data[k]
                        var card = $($('noscript#order-clone').html()).clone()
                        card.attr('data-id',data.id)
                        card.find('.card-title').text('Queue #' + data.queue)
                        Object.keys(data.item_arr).map(i=>{
                            var row = card.find('.order-list-header').clone().removeClass('order-list-header bg-gradient-warning')
                            row.find('div').first().text(data.item_arr[i].item)
                            row.find('div').last().text(parseInt(data.item_arr[i].quantity).toLocaleString())
                            card.find('.order-body').append(row)
                        })
                            console.log(data)
                        $('#order-field').append(card)
                        card.find('.order-served').click(function(){
                            _conf("Are you sure to serve <b>Queue #: "+data.queue+"</b>?",'serve_order', [data.id])
                        })
                    })
                }
            }
        })
    }
    $(function(){
        $('body').addClass('sidebar-collapse')
        var load_data = setInterval(() => {
            get_order()
        }, 500);
    })
    function serve_order($id){
        start_loader();
		$.ajax({
			url:_base_url_+"classes/Master.php?f=serve_order",
			method:"POST",
			data:{id: $id},
			dataType:"json",
			error:err=>{
				console.log(err)
				alert_toast("An error occured.",'error');
				end_loader();
			},
			success:function(resp){
				if(typeof resp== 'object' && resp.status == 'success'){
                    $('.modal').modal('hide')
					alert_toast("Order has been served.",'success');
					$('.order-item[data-id="'+$id+'"]').remove()
				}else{
					alert_toast("An error occured.",'error');
				}
					end_loader();
			}
		})
    }
</script>